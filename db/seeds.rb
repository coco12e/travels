# Conservation de tes suppressions pour éviter les doublons à chaque lancement
Flight.destroy_all
Place.destroy_all
Category.destroy_all
Trip.destroy_all
Destination.destroy_all
Continent.destroy_all
Region.destroy_all
User.destroy_all

# 1. Création de la Région
moyen_orient_reg = Region.create!(name: "Moyen-Orient")

# 2. Création des Continents
moyen_orient = Continent.create!(name: "Moyen-Orient", banner_url: "Moyen-orient.jpg")
Continent.create!(name: "Europe", banner_url: "europe.jpg")
Continent.create!(name: "Afrique", banner_url: "afrique.jpg")
Continent.create!(name: "Asie", banner_url: "asie.jpg")
Continent.create!(name: "Amérique", banner_url: "amerique.jpg")
Continent.create!(name: "Océanie", banner_url: "oceanie.jpg")

# 3. Création des Destinations
destinations_data = [
  { name: "L'Égypte", banner_url: "le-caire.jpg" },
  { name: "Jordanie", banner_url: "amman.jpg" },
  { name: "Émirats Arabes Unis", banner_url: "dubai.jpg" },
  { name: "L'Arabie Saoudite", banner_url: "arabie-saoudite.jpg" },
  { name: "Le Liban", banner_url: "beyrouth.jpg" },
  { name: "Chypre", banner_url: "chypre.jpg" },
  { name: "Qatar", banner_url: "qatar.jpg" },
  { name: "Turquie", banner_url: "turquie.jpg" },
  { name: "Oman", banner_url: "oman.jpg" }
]


created_destinations = {}
destinations_data.each do |dest|
  created_destinations[dest[:name]] = Destination.create!(
    name: dest[:name],
    banner_url: dest[:banner_url],
    continent_id: moyen_orient.id,
    region_id: moyen_orient_reg.id
  )
end

egypte = created_destinations["L'Égypte"]

## 4. Création des Vols (Flights)
Flight.create!(
  company: "Air France",
  photo: "air-france-logo.jpg",
  departure: "Paris (CDG)",
  arrival: "Le Caire (CAI)",
  take_off_at: "20h10",
  land_at: "21h40",
  duration: "4h20",
  stopover: "",
  company_return: "Air France",
  photo_return: "air-france-logo.jpg",
  take_off_at_return: "03h25",
  land_at_return: "07h00",
  duration_return: "4h25",
  stopover_return: "",
  destination_id: egypte.id
)

Flight.create!(
  company: "Egyptair",
  photo: "egyptair-logo.jpg",
  departure: "Paris (CDG)",
  arrival: "Le Caire (CAI)",
  take_off_at: "16h00",
  land_at: "21h20",
  duration: "4h20",
  stopover: "",
  company_return: "Air France",
  photo_return: "air-france-logo.jpg",
  take_off_at_return: "03h25",
  land_at_return: "07h00",
  duration_return: "4h25",
  stopover_return: "",
  destination_id: egypte.id
)

Flight.create!(
  company: "Lufthansa",
  photo: "lufthansa.jpg",
  departure: "Paris (CDG)",
  arrival: "Le Caire (CAI)",
  take_off_at: "11h55",
  land_at: "01h15",
  duration: "12h20",
  stopover: "1 correspondance (Francfort)",
  company_return: "Lufthansa",
  photo_return: "lufthansa.jpg",
  take_off_at_return: "07h25",
  land_at_return: "15h10",
  duration_return: "18h45",
  stopover_return: "1 correspondance (Francfort)",
  destination_id: egypte.id
)

Flight.create!(
  company: "Swissair",
  photo: "swissair.png",
  departure: "Paris (CDG)",
  arrival: "Le Caire (CAI)",
  take_off_at: "07h45",
  land_at: "15h20",
  duration: "6h35",
  stopover: "1 correspondance (Zurich)",
  company_return: "Egyptair",
  photo_return: "egyptair-logo.jpg",
  take_off_at_return: "10h00",
  land_at_return: "14h20",
  duration_return: "4h20",
  stopover_return: "",
  destination_id: egypte.id
)

Flight.create!(
  company: "Egyptair",
  photo: "egyptair-logo.jpg",
  departure: "Paris (CDG)",
  arrival: "Le Caire (CAI)",
  take_off_at: "16h00",
  land_at: "21h20",
  duration: "4h20",
  stopover: "",
  company_return: "Austrian",
  photo_return: "austrian.png",
  take_off_at_return: "10h50",
  land_at_return: "18h50",
  duration_return: "9h00",
  stopover_return: "1 correspondance (Vienne)",
  destination_id: egypte.id
)


# 5. Création des Catégories
categories_data = [
  { name: "La Capitale et les marchés traditionnels", photo_url: "capitale.jpg" },
  { name: "Les autres Villes", photo_url: "alexandrie.jpg" },
  { name: "Les Stations Balnéaires", photo_url: "sharm.jpg" },
  { name: "Les Hors circuits", photo_url: "hors-circuits.jpg" },
  { name: "Les déserts et le Nil", photo_url: "nil.jpg" },
  { name: "Les plats typiques", photo_url: "plats.jpg" }
]

created_categories = {}
categories_data.each do |data|
  created_categories[data[:name]] = Category.create!(
    name: data[:name],
    photo_url: data[:photo_url],
    destination_id: egypte.id
  )
end

cat_capitale = created_categories["La Capitale et les marchés traditionnels"]
cat_villes = created_categories["Les autres Villes"]

# 6. Création des Lieux (Places)
# --- AU CAIRE ---
Place.create!(
  name: "La Tour du Caire",
  sub_category: "Les activités à faire au Caire",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "tour-du-caire.jpg",
  description: "À la Tour du Caire, les visiteurs peuvent monter au sommet pour admirer la vue sur la ville et le Nil. Il y a aussi un restaurant panoramique. Les touristes prennent des photos et profitent du paysage, surtout le soir."
)

Place.create!(
  name: "Découverte des pyramides de Gizeh",
  sub_category: "Les activités à faire au Caire",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "pyramide.jpg",
  description: "Au Caire, on peut visiter les pyramides de Gizeh et le Sphinx pour explorer les monuments emblématiques de l'Égypte ancienne. Les visiteurs peuvent se promener autour des pyramides."
)

Place.create!(
  name: "La Citadelle de Saladin",
  sub_category: "Les activités à faire au Caire",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "citadelle-saladin.jpg",
  description: "Située sur une colline, la Citadelle de Saladin offre une vue panoramique imprenable sur tout Le Caire. On y visite la magnifique mosquée d'Albâtre (Méhémet Ali)."
)

Place.create!(
  name: "Le Quartier Copte",
  sub_category: "Les activités à faire au Caire",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "quartier-copte.jpg",
  description: "Le quartier copte est le cœur chrétien du Vieux-Caire, abritant l'Église Suspendue et des églises millénaires. Les visiteurs peuvent découvrir des ruelles étroites et paisibles."
)

Place.create!(
  name: "Le Grand Musée Égyptien",
  sub_category: "Les activités à faire au Caire",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "grand-musee-egyptien.jpg",
  description: "Le Grand Musée Égyptien est l'un des plus grands musées au monde dédiés à une seule civilisation. Situé près des pyramides, il expose les trésors inestimables du pharaon Toutânkhamon."
)

Place.create!(
  name: "Khan el-Khalili",
  sub_category: "Les marchés traditionnels",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "Khan.jpg",
  description: "À Khan el-Khalili, on peut acheter des souvenirs et des objets artisanaux traditionnels. On y trouve des épices, des bijoux et des lanternes orientales."
)

Place.create!(
  name: "Souk El-Fustat",
  sub_category: "Les marchés traditionnels",
  category_id: cat_capitale.id,
  destination_id: egypte.id,
  photo_url: "Souk.jpg",
  description: "Le Souk El-Fustat est un marché traditionnel situé dans le vieux Caire. Il est célèbre pour ses tissus, tapis, artisanat et objets décoratifs fabriqués à la main."
)

# --- ALEXANDRIE ---
Place.create!(
  name: "Citadelle de Qaitbay",
  sub_category: "Les activités à faire à Alexandrie",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "citadelle.jpg",
  description: "Érigée sur l'emplacement exact du célèbre Phare d'Alexandrie, la Citadelle de Qaitbay est une forteresse défensive impressionnante du XVe siècle. Les visiteurs peuvent explorer ses tours et ses remparts tout en profitant d'une vue imprenable sur la mer Méditerranée. C'est un endroit idéal pour découvrir l'histoire médiévale et la beauté maritime d'Alexandrie."
)

Place.create!(
  name: "La Corniche et le pont Stanley",
  sub_category: "Les activités à faire à Alexandrie",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "stanley.jpg",
  description: "Une balade emblématique le long de la Méditerranée qui incarne l'âme de la ville. Le pont Stanley, avec son architecture élégante, offre l'un des plus beaux points de vue sur la côte alexandrine. C'est le lieu de rendez-vous préféré des locaux pour admirer le coucher du soleil et ressentir la brise marine."
)

Place.create!(
  name: "Palais de Montaza",
  sub_category: "Les activités à faire à Alexandrie",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "montaza.jpeg",
  description: "Ancienne résidence d'été royale, ce palais est un chef-d'œuvre mêlant les styles florentin et turc. Il est entouré de vastes jardins magnifiques de plusieurs hectares ouverts au public. Les visiteurs peuvent s'y promener au milieu des pins et des palmiers, offrant une oasis de calme et de verdure face aux eaux bleues de la Méditerranée."
)

# --- LOUXOR ---
Place.create!(
  name: "Temple de Karnak",
  sub_category: "Les activités à faire au Louxor",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "Karnak.jpg",
  description: "À Karnak, l'activité principale est de se promener dans le temple pour découvrir ses immenses colonnes, pylônes et hiéroglyphes. Les visiteurs peuvent admirer les allées de sphinx, les sanctuaires et apprendre l'histoire de l'Égypte ancienne. C'est une expérience culturelle et historique unique à Louxor, idéale pour explorer l'architecture et les croyances des pharaons."
)

Place.create!(
  name: "Vallée des Rois",
  sub_category: "Les activités à faire au Louxor",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "Vallée.jpg",
  description: "Découvrez le site de sépulture sacré des pharaons du Nouvel Empire. Les visiteurs peuvent explorer des tombes magnifiquement décorées, dont les parois racontent le voyage des rois vers l'au-delà. C'est un lieu chargé de mystère et de spiritualité, niché dans une vallée désertique impressionnante où reposent les plus grands noms de l'histoire égyptienne."
)

Place.create!(
  name: "Temple de Louxor",
  sub_category: "Les activités à faire au Louxor",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "Louxor.jpg",
  description: "Situé en plein centre-ville, ce temple est spectaculaire à la tombée de la nuit lorsqu'il est illuminé. Construit principalement sous les règnes d'Amenhotep III et de Ramsès II, il était autrefois relié au temple de Karnak par une immense allée de sphinx. C'est un chef-d'œuvre de l'élégance architecturale égyptienne qui témoigne de la dévotion aux dieux thébains."
)

# --- ASSOUAN ---
Place.create!(
  name: "Temple de Philae",
  sub_category: "Les activités à faire à Assouan",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "philae.jpg",
  description: "Dédié à la déesse Isis, le temple de Philae est magnifiquement situé sur une île du Nil. Les visiteurs profitent d'une balade paisible en bateau pour rejoindre le sanctuaire. Sauvé des eaux lors de la construction du barrage, ce temple est l'un des sites les plus romantiques d'Égypte, entouré par les eaux bleues du fleuve et les rochers de granit."
)

Place.create!(
  name: "Balade en Felouque",
  sub_category: "Les activités à faire à Assouan",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "felouque.jpg",
  description: "Une expérience paisible à bord d'un voilier traditionnel égyptien pour admirer les paysages nubiens au coucher du soleil. Sans moteur, portés par le vent, les voyageurs glissent sur le Nil pour découvrir les îles Éléphantine et Kitchener. C'est la manière la plus authentique et relaxante de découvrir la beauté sauvage de la Haute-Égypte."
)

Place.create!(
  name: "Temple de Kôm Ombo",
  sub_category: "Les activités à faire à Assouan",
  category_id: cat_villes.id,
  destination_id: egypte.id,
  photo_url: "ombo.jpeg",
  description: "Situé au bord du Nil, le temple de Kôm Ombo est unique en Égypte car il est dédié à deux divinités : Sobek, le dieu crocodile, et Haroëris, le dieu faucon. Cette architecture double parfaitement symétrique permet de découvrir des bas-reliefs exceptionnels détaillant des instruments de médecine anciens et un calendrier sacré. Les visiteurs peuvent également explorer le musée des momies de crocodiles juste à côté."
)


puts "Seeds terminées avec succès !"

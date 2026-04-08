Bookmark.destroy_all
Flight.destroy_all
Transport.destroy_all
Trip.destroy_all
Place.destroy_all
Category.destroy_all
Destination.destroy_all
Continent.destroy_all
Region.destroy_all

moyen_orient_reg = Region.create!(name: "Moyen-Orient")

moyen_orient = Continent.create!(name: "Moyen-Orient", banner_url: "Moyen-orient.jpg")
Continent.create!(name: "Europe", banner_url: "europe.jpg")
Continent.create!(name: "Afrique", banner_url: "afrique.jpg")
Continent.create!(name: "Asie", banner_url: "asie.jpg")
Continent.create!(name: "Amérique", banner_url: "amerique.jpg")
Continent.create!(name: "Océanie", banner_url: "oceanie.jpg")

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
    continent: moyen_orient,
    region: moyen_orient_reg
  )
end

egypte = created_destinations["L'Égypte"]

egypte = created_destinations["L'Égypte"]

Flight.create!(
  company: "Air France", photo: "air france logo.jpg",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "20h10", land_at: "00h30", duration: "4h20", stopover: "",
  company_return: "Air France", photo_return: "air france logo.jpg",
  take_off_at_return: "03h25", land_at_return: "07h00", duration_return: "4h25", stopover_return: "",
  destination: egypte
)

Flight.create!(
  company: "Egyptair", photo: "egyptair logo.jpg",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "16h00", land_at: "21h20", duration: "4h20", stopover: "",
  company_return: "Air France", photo_return: "air france logo.jpg",
  take_off_at_return: "03h25", land_at_return: "07h00", duration_return: "4h25", stopover_return: "",
  destination: egypte
)

Flight.create!(
  company: "Lufthansa", photo: "lufthansa.jpg",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "11h55", land_at: "01h15", duration: "12h20", stopover: "1 correspondance (Francfort)",
  company_return: "Lufthansa", photo_return: "lufthansa.jpg",
  take_off_at_return: "07h25", land_at_return: "15h10", duration_return: "18h45", stopover_return: "1 correspondance (Francfort)",
  destination: egypte
)

Flight.create!(
  company: "Swissair", photo: "swissair.png",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "07h45", land_at: "15h20", duration: "6h35", stopover: "1 correspondance (Zurich)",
  company_return: "Egyptair", photo_return: "egyptair logo.jpg",
  take_off_at_return: "10h00", land_at_return: "14h20", duration_return: "4h20", stopover_return: "",
  destination: egypte
)

Flight.create!(
  company: "Egyptair", photo: "egyptair logo.jpg",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "16h00", land_at: "21h20", duration: "4h20", stopover: "",
  company_return: "Austrian", photo_return: "austrian.png",
  take_off_at_return: "10h50", land_at_return: "18h50", duration_return: "9h00", stopover_return: "1 correspondance (Vienne)",
  destination: egypte
)

Flight.create!(
  company: "Royal Jordanienne", photo: "royal-jordanienne.png",
  departure: "Paris (CDG)", arrival: "Le Caire (CAI)",
  take_off_at: "16h00", land_at: "00h30", duration: "8h30", stopover: "1 correspondance (Amman)",
  company_return: "Royal Jordanienne", photo_return: "rj.png",
  take_off_at_return: "07h30", land_at_return: "14h30", duration_return: "7h00", stopover_return: "1 correspondance (Amman)",
  destination: egypte
)

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
    destination: egypte
  )
end

cat_capitale   = created_categories["La Capitale et les marchés traditionnels"]
cat_villes     = created_categories["Les autres Villes"]
cat_balneaires = created_categories["Les Stations Balnéaires"]

[
{ name: "La Tour du Caire", sub_category: "Les activités à faire au Caire", photo_url: "tour-du-caire.jpg", address: "Nile Corniche, Zamalek, Cairo, Egypt", description: "À la Tour du Caire, les visiteurs peuvent monter au sommet pour admirer la vue sur la ville et le Nil. Il y a aussi un restaurant panoramique. Les touristes prennent des photos et profitent du paysage, surtout le soir.", category: cat_capitale },
{ name: "Découverte des pyramides de Gizeh", sub_category: "Les activités à faire au Caire", photo_url: "pyramide.jpg", address: "Al Haram, Giza, Egypt", description: "Au Caire, on peut visiter les pyramides de Gizeh et le Sphinx pour explorer les monuments emblématiques de l'Égypte ancienne.", category: cat_capitale },
{ name: "La Citadelle de Saladin", sub_category: "Les activités à faire au Caire", photo_url: "citadelle-saladin.jpg", address: "Al-Qal'a, Cairo, Egypt", description: "Située sur une colline, la Citadelle de Saladin offre une vue panoramique imprenable sur tout Le Caire.", category: cat_capitale },
{ name: "Le Quartier Copte", sub_category: "Les activités à faire au Caire", photo_url: "quartier-copte.jpg", address: "Mar Girgis, Old Cairo, Cairo, Egypt", description: "Le quartier copte est le cœur chrétien du Vieux-Caire, abritant l'Église Suspendue et des églises millénaires.", category: cat_capitale },
{ name: "Le Grand Musée Égyptien", sub_category: "Les activités à faire au Caire", photo_url: "grand-musee-egyptien.jpg", address: "Wahat Al Bahariya, Al Remaya Square, Giza, Egypt", description: "Le Grand Musée Égyptien est l'un des plus grands musées au monde dédiés à une seule civilisation.", category: cat_capitale },
{ name: "Khan el-Khalili", sub_category: "Les marchés traditionnels", photo_url: "Khan.jpg", address: "El-Gamaleya, Cairo, Egypt", description: "À Khan el-Khalili, on peut acheter des souvenirs et des objets artisanaux traditionnels.", category: cat_capitale },
{ name: "Souk El-Fustat", sub_category: "Les marchés traditionnels", photo_url: "Souk.jpg", address: "El-Fustat, Old Cairo, Cairo, Egypt", description: "Le Souk El-Fustat est un marché traditionnel situé dans le vieux Caire.", category: cat_capitale },
{ name: "Citadelle de Qaitbay", sub_category: "Les activités à faire à Alexandrie", photo_url: "citadelle.jpg", address: "Qaitbay, El Anfushi, Alexandria, Egypt", description: "Érigée sur l'emplacement exact du célèbre Phare d'Alexandrie, la Citadelle de Qaitbay est une forteresse défensive impressionnante du XVe siècle.", category: cat_villes },
{ name: "La Corniche et le pont Stanley", sub_category: "Les activités à faire à Alexandrie", photo_url: "stanley.jpg", address: "Stanley Bridge, Corniche Road, Alexandria, Egypt", description: "Une balade emblématique le long de la Méditerranée qui incarne l'âme de la ville.", category: cat_villes },
{ name: "Palais de Montaza", sub_category: "Les activités à faire à Alexandrie", photo_url: "montaza.jpeg", address: "Montaza, Alexandria, Egypt", description: "Ancienne résidence d'été royale, ce palais est un chef-d'œuvre mêlant les styles florentin et turc.", category: cat_villes },
{ name: "Temple de Karnak", sub_category: "Les activités à faire au Louxor", photo_url: "Karnak.jpg", address: "Karnak, Luxor, Egypt", description: "À Karnak, l'activité principale est de se promener dans le temple pour découvrir ses immenses colonnes, pylônes et hiéroglyphes.", category: cat_villes },
{ name: "Vallée des Rois", sub_category: "Les activités à faire au Louxor", photo_url: "Vallée.jpg", address: "Valley of the Kings, West Bank, Luxor, Egypt", description: "Découvrez le site de sépulture sacré des pharaons du Nouvel Empire.", category: cat_villes },
{ name: "Temple de Louxor", sub_category: "Les activités à faire au Louxor", photo_url: "Louxor.jpg", address: "Luxor Temple, Corniche El Nile, Luxor, Egypt", description: "Situé en plein centre-ville, ce temple est spectaculaire à la tombée de la nuit lorsqu'il est illuminé.", category: cat_villes },
{ name: "Temple de Philae", sub_category: "Les activités à faire à Assouan", photo_url: "philae.jpg", address: "Agilkia Island, Aswan, Egypt", description: "Dédié à la déesse Isis, le temple de Philae est magnifiquement situé sur une île du Nil.", category: cat_villes },
{ name: "Balade en Felouque", sub_category: "Les activités à faire à Assouan", photo_url: "felouque.jpg", address: "Corniche El Nil, Aswan, Egypt", description: "Une expérience paisible à bord d'un voilier traditionnel égyptien pour admirer les paysages nubiens au coucher du soleil.", category: cat_villes },
{ name: "Temple de Kôm Ombo", sub_category: "Les activités à faire à Assouan", photo_url: "ombo.jpeg", address: "Kom Ombo, Aswan Governorate, Egypt", description: "Situé au bord du Nil, le temple de Kôm Ombo est unique en Égypte car il est dédié à deux divinités : Sobek et Haroëris.", category: cat_villes },
{ name: "Profiter de la plage", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "plage.jpg", address: "Sharks Bay Beach, Sharm El Sheikh, Egypt", description: "À Sharm el-Sheikh, on peut se détendre sur le sable, se baigner dans les eaux claires et profiter du soleil et de la mer Rouge.", category: cat_balneaires },
{ name: "Naama Bay", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "bay.jpg", address: "Naama Bay, Sharm El Sheikh, Egypt", description: "À Naama Bay, on peut se balader le long de la promenade, découvrir les cafés, restaurants et boutiques, et profiter de la vie nocturne animée.", category: cat_balneaires },
{ name: "Saint Catherine", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "saint.jpg", address: "Saint Catherine, South Sinai, Egypt", description: "À Saint Catherine, on peut faire une randonnée sur le Mont Sinaï pour admirer le lever du soleil et les paysages désertiques.", category: cat_balneaires },
{ name: "Se détendre sur la plage", sub_category: "Les activités à faire à Marsa Matrouh", photo_url: "marsa.jpg", address: "Cleopatra Beach, Marsa Matruh, Egypt", description: "À Marsa Matrouh, les visiteurs peuvent marcher sur le sable blanc, prendre le soleil et se baigner dans les eaux turquoises.", category: cat_balneaires },
{ name: "Salt Cave Salman", sub_category: "Les activités à faire à Marsa Matrouh", photo_url: "salt.jpg", address: "Salman Cave, Marsa Matruh, Egypt", description: "La grotte de sel Salman est un site naturel unique situé près de Marsa Matrouh.", category: cat_balneaires },
{ name: "Safari dans le désert", sub_category: "Les activités à faire à Hurghada", photo_url: "safari.jpg", address: "Eastern Desert, Hurghada, Red Sea, Egypt", description: "On peut faire une excursion en quad ou en 4x4 dans le désert pour découvrir les paysages désertiques.", category: cat_balneaires },
{ name: "Plongée et snorkeling", sub_category: "Les activités à faire à Hurghada", photo_url: "plonge.jpg", address: "Giftun Island, Hurghada, Red Sea, Egypt", description: "Hurghada est réputée pour ses récifs coralliens exceptionnels.", category: cat_balneaires },
{ name: "Wadi El Gemal", sub_category: "Les activités à faire à Marsa Alam", photo_url: "Wadi.jpg", address: "Wadi El Gemal National Park, Marsa Alam, Red Sea, Egypt", description: "Visite du parc national Wadi El Gemal, une réserve naturelle avec des paysages désertiques et une faune sauvage unique.", category: cat_balneaires },
{ name: "Randonnée dans les montagnes", sub_category: "Les activités à faire à Taba", photo_url: "taba.jpg", address: "Colored Canyon, Taba, South Sinai, Egypt", description: "Taba est proche du Sinaï, idéal pour des randonnées dans les montagnes et canyons.", category: cat_balneaires },
{ name: "Visite du château de Salah el-Din", sub_category: "Les activités à faire à Taba", photo_url: "din.jpg", address: "Pharaoh's Island, Taba, South Sinai, Egypt", description: "Situé sur une île au milieu du golfe d'Aqaba, ce château médiéval offre une vue panoramique spectaculaire sur quatre pays.", category: cat_balneaires },
{ name: "Détente au bord de la mer", sub_category: "Les activités à faire à Nuweiba", photo_url: "Nuweiba.jpg", address: "Nuweiba Beach, Nuweiba, South Sinai, Egypt", description: "Marcher sur le sable blanc, se relaxer et profiter du calme du littoral.", category: cat_balneaires }
].each do |data|
  Place.create!(
    name: data[:name],
    sub_category: data[:sub_category],
    category: data[:category],
    destination_id: egypte.id,
    photo_url: data[:photo_url],
    address: data[:address],
    description: data[:description]
  )
end

puts "Seeds terminées avec succès !"

Bookmark.destroy_all
Flight.destroy_all
TripTransport.destroy_all
Trip.destroy_all
Transport.destroy_all
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
cat_hors       = created_categories["Les Hors circuits"]
cat_dserts     = created_categories["Les déserts et le Nil"]
cat_plats      = created_categories["Les plats typiques"]

[
  # La Capitale
  { name: "La Tour du Caire", sub_category: "Les activités à faire au Caire", photo_url: "tour-du-caire.jpg", address: "Nile Corniche, Zamalek, Cairo, Egypt", tags: nil, description: "À la Tour du Caire, les visiteurs peuvent monter au sommet pour admirer la vue sur la ville et le Nil. Il y a aussi un restaurant panoramique. Les touristes prennent des photos et profitent du paysage, surtout le soir.", category: cat_capitale },
  { name: "Découverte des pyramides de Gizeh", sub_category: "Les activités à faire au Caire", photo_url: "pyramide.jpg", address: "Al Haram, Giza, Egypt", tags: nil, description: "Au Caire, on peut visiter les pyramides de Gizeh et le Sphinx pour explorer les monuments emblématiques de l'Égypte ancienne.", category: cat_capitale },
  { name: "La Citadelle de Saladin", sub_category: "Les activités à faire au Caire", photo_url: "citadelle-saladin.jpg", address: "Al-Qal'a, Cairo, Egypt", tags: nil, description: "Située sur une colline, la Citadelle de Saladin offre une vue panoramique imprenable sur tout Le Caire.", category: cat_capitale },
  { name: "Le Quartier Copte", sub_category: "Les activités à faire au Caire", photo_url: "quartier-copte.jpg", address: "Mar Girgis, Old Cairo, Cairo, Egypt", tags: nil, description: "Le quartier copte est le cœur chrétien du Vieux-Caire, abritant l'Église Suspendue et des églises millénaires.", category: cat_capitale },
  { name: "Le Grand Musée Égyptien", sub_category: "Les activités à faire au Caire", photo_url: "grand-musee-egyptien.jpg", address: "Wahat Al Bahariya, Al Remaya Square, Giza, Egypt", tags: nil, description: "Le Grand Musée Égyptien est l'un des plus grands musées au monde dédiés à une seule civilisation.", category: cat_capitale },
  { name: "Khan el-Khalili", sub_category: "Les marchés traditionnels", photo_url: "Khan.jpg", address: "El-Gamaleya, Cairo, Egypt", tags: nil, description: "À Khan el-Khalili, on peut acheter des souvenirs et des objets artisanaux traditionnels.", category: cat_capitale },
  { name: "Souk El-Fustat", sub_category: "Les marchés traditionnels", photo_url: "Souk.jpg", address: "El-Fustat, Old Cairo, Cairo, Egypt", tags: nil, description: "Le Souk El-Fustat est un marché traditionnel situé dans le vieux Caire.", category: cat_capitale },

  # Les autres Villes
  { name: "Citadelle de Qaitbay", sub_category: "Les activités à faire à Alexandrie", photo_url: "citadelle.jpg", address: "Qaitbay, El Anfushi, Alexandria, Egypt", tags: nil, description: "Érigée sur l'emplacement exact du célèbre Phare d'Alexandrie, la Citadelle de Qaitbay est une forteresse défensive impressionnante du XVe siècle.", category: cat_villes },
  { name: "La Corniche et le pont Stanley", sub_category: "Les activités à faire à Alexandrie", photo_url: "stanley.jpg", address: "Stanley Bridge, Corniche Road, Alexandria, Egypt", tags: nil, description: "Une balade emblématique le long de la Méditerranée qui incarne l'âme de la ville.", category: cat_villes },
  { name: "Palais de Montaza", sub_category: "Les activités à faire à Alexandrie", photo_url: "montaza.jpeg", address: "Montaza, Alexandria, Egypt", tags: nil, description: "Ancienne résidence d'été royale, ce palais est un chef-d'œuvre mêlant les styles florentin et turc.", category: cat_villes },
  { name: "Temple de Karnak", sub_category: "Les activités à faire au Louxor", photo_url: "Karnak.jpg", address: "Karnak, Luxor, Egypt", tags: nil, description: "À Karnak, l'activité principale est de se promener dans le temple pour découvrir ses immenses colonnes, pylônes et hiéroglyphes.", category: cat_villes },
  { name: "Vallée des Rois", sub_category: "Les activités à faire au Louxor", photo_url: "Vallée.jpg", address: "Valley of the Kings, West Bank, Luxor, Egypt", tags: nil, description: "Découvrez le site de sépulture sacré des pharaons du Nouvel Empire.", category: cat_villes },
  { name: "Temple de Louxor", sub_category: "Les activités à faire au Louxor", photo_url: "Louxor.jpg", address: "Luxor Temple, Corniche El Nile, Luxor, Egypt", tags: nil, description: "Situé en plein centre-ville, ce temple est spectaculaire à la tombée de la nuit lorsqu'il est illuminé.", category: cat_villes },
  { name: "Temple de Philae", sub_category: "Les activités à faire à Assouan", photo_url: "philae.jpg", address: "Agilkia Island, Aswan, Egypt", tags: nil, description: "Dédié à la déesse Isis, le temple de Philae est magnifiquement situé sur une île du Nil.", category: cat_villes },
  { name: "Balade en Felouque", sub_category: "Les activités à faire à Assouan", photo_url: "felouque.jpg", address: "Corniche El Nil, Aswan, Egypt", tags: nil, description: "Une expérience paisible à bord d'un voilier traditionnel égyptien pour admirer les paysages nubiens au coucher du soleil.", category: cat_villes },
  { name: "Temple de Kôm Ombo", sub_category: "Les activités à faire à Assouan", photo_url: "ombo.jpeg", address: "Kom Ombo, Aswan Governorate, Egypt", tags: nil, description: "Situé au bord du Nil, le temple de Kôm Ombo est unique en Égypte car il est dédié à deux divinités : Sobek et Haroëris.", category: cat_villes },

  # Les Stations Balnéaires
  { name: "Profiter de la plage", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "plage.jpg", address: "Sharks Bay Beach, Sharm El Sheikh, Egypt", tags: nil, description: "À Sharm el-Sheikh, on peut se détendre sur le sable, se baigner dans les eaux claires et profiter du soleil et de la mer Rouge.", category: cat_balneaires },
  { name: "Naama Bay", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "bay.jpg", address: "Naama Bay, Sharm El Sheikh, Egypt", tags: nil, description: "À Naama Bay, on peut se balader le long de la promenade, découvrir les cafés, restaurants et boutiques, et profiter de la vie nocturne animée.", category: cat_balneaires },
  { name: "Saint Catherine", sub_category: "Les activités à faire à Sharm el-Sheikh", photo_url: "saint.jpg", address: "Saint Catherine, South Sinai, Egypt", tags: nil, description: "À Saint Catherine, on peut faire une randonnée sur le Mont Sinaï pour admirer le lever du soleil et les paysages désertiques.", category: cat_balneaires },
  { name: "Se détendre sur la plage", sub_category: "Les activités à faire à Marsa Matrouh", photo_url: "marsa.jpg", address: "Cleopatra Beach, Marsa Matruh, Egypt", tags: nil, description: "À Marsa Matrouh, les visiteurs peuvent marcher sur le sable blanc, prendre le soleil et se baigner dans les eaux turquoises.", category: cat_balneaires },
  { name: "Salt Cave Salman", sub_category: "Les activités à faire à Marsa Matrouh", photo_url: "salt.jpg", address: "Salman Cave, Marsa Matruh, Egypt", tags: nil, description: "La grotte de sel Salman est un site naturel unique situé près de Marsa Matrouh.", category: cat_balneaires },
  { name: "Safari dans le désert", sub_category: "Les activités à faire à Hurghada", photo_url: "safari.jpg", address: "Eastern Desert, Hurghada, Red Sea, Egypt", tags: nil, description: "On peut faire une excursion en quad ou en 4x4 dans le désert pour découvrir les paysages désertiques.", category: cat_balneaires },
  { name: "Plongée et snorkeling", sub_category: "Les activités à faire à Hurghada", photo_url: "plonge.jpg", address: "Giftun Island, Hurghada, Red Sea, Egypt", tags: nil, description: "Hurghada est réputée pour ses récifs coralliens exceptionnels.", category: cat_balneaires },
  { name: "Wadi El Gemal", sub_category: "Les activités à faire à Marsa Alam", photo_url: "Wadi.jpg", address: "Wadi El Gemal National Park, Marsa Alam, Red Sea, Egypt", tags: nil, description: "Visite du parc national Wadi El Gemal, une réserve naturelle avec des paysages désertiques et une faune sauvage unique.", category: cat_balneaires },
  { name: "Randonnée dans les montagnes", sub_category: "Les activités à faire à Taba", photo_url: "taba.jpg", address: "Colored Canyon, Taba, South Sinai, Egypt", tags: nil, description: "Taba est proche du Sinaï, idéal pour des randonnées dans les montagnes et canyons.", category: cat_balneaires },
  { name: "Visite du château de Salah el-Din", sub_category: "Les activités à faire à Taba", photo_url: "din.jpg", address: "Pharaoh's Island, Taba, South Sinai, Egypt", tags: nil, description: "Situé sur une île au milieu du golfe d'Aqaba, ce château médiéval offre une vue panoramique spectaculaire sur quatre pays.", category: cat_balneaires },
  { name: "Détente au bord de la mer", sub_category: "Les activités à faire à Nuweiba", photo_url: "Nuweiba.jpg", address: "Nuweiba Beach, Nuweiba, South Sinai, Egypt", tags: nil, description: "Marcher sur le sable blanc, se relaxer et profiter du calme du littoral.", category: cat_balneaires },

  # Les Hors circuits
  { name: "Cascades de Wadi El-Rayan", sub_category: "Les activités à faire à Fayoum", photo_url: "cascade.jpg", address: "Wadi El Rayan, Fayoum, Egypt", tags: nil, description: "Les cascades de Wadi El-Rayan sont les seules cascades naturelles d'Égypte. On peut y admirer deux lacs reliés par une cascade, se promener dans le désert et profiter de paysages spectaculaires entre dunes et eau.", category: cat_hors },
  { name: "Oasis de Tunis", sub_category: "Les activités à faire à Fayoum", photo_url: "oasis-de-tunis.jpg", address: "Tunis Village, Fayoum, Egypt", tags: nil, description: "Le village de Tunis est un petit village d'artistes niché au bord du lac Qarun. On peut y découvrir des ateliers de poterie, se promener dans les ruelles colorées et profiter d'une vue magnifique sur le lac.", category: cat_hors },
  { name: "Lac Qarun", sub_category: "Les activités à faire à Fayoum", photo_url: "lac-qarun.jpg", address: "Lake Qarun, Fayoum, Egypt", tags: nil, description: "Le lac Qarun est l'un des plus anciens lacs naturels du monde. On peut y faire des balades en bateau, observer les oiseaux migrateurs et profiter du paysage désertique autour du lac.", category: cat_hors },
  { name: "Découverte culturelle dans un village nubien", sub_category: "Le village Nubians", photo_url: "village-nubien.jpg", address: "Aswan, Egypt", tags: nil, description: "Dans un village nubien près d'Assouan, on peut visiter les maisons colorées, rencontrer les habitants et découvrir leur culture et traditions. Les visiteurs peuvent aussi goûter la cuisine locale, voir l'artisanat traditionnel et écouter de la musique nubienne.", category: cat_hors },
  { name: "Le bain de Cléopâtre", sub_category: "Oasis : lieux et activités à découvrir", photo_url: "cleopatre.jpg", address: "Siwa, Matrouh, Egypt", tags: nil, description: "Le bain de Cléopâtre est une source naturelle d'eau douce à Siwa. On peut s'y baigner dans un cadre désertique unique et découvrir l'une des piscines naturelles les plus célèbres d'Égypte.", category: cat_hors },
  { name: "Gebel al-Mawta", sub_category: "Oasis : lieux et activités à découvrir", photo_url: "mawta.avif", address: "Siwa, Matrouh, Egypt", tags: nil, description: "Gebel al-Mawta, la montagne des morts, est un site archéologique unique à Siwa. On peut y explorer des tombeaux rupestres datant de l'époque ptolémaïque et admirer les peintures et hiéroglyphes anciens.", category: cat_hors },
  { name: "Les lacs de sel", sub_category: "Oasis : lieux et activités à découvrir", photo_url: "sel.jpg", address: "Siwa, Matrouh, Egypt", tags: nil, description: "Les lacs de sel de Siwa, dont le célèbre lac Zeitoun, permettent de flotter naturellement comme dans la mer Morte. Une expérience unique dans un cadre désertique spectaculaire.", category: cat_hors },

  # Les déserts et le Nil
  { name: "Désert Blanc", sub_category: "Les déserts : lieux à découvrir", photo_url: "desert-blanc.jpg", address: "White Desert, Farafra, Egypt", tags: nil, description: "Observer les formations rocheuses blanches uniques, camper dans le désert et faire de la photographie paysagère.", category: cat_dserts },
  { name: "Désert Noir", sub_category: "Les déserts : lieux à découvrir", photo_url: "desert-noir.jpg", address: "Black Desert, Bahariya, Egypt", tags: nil, description: "Le désert Noir tire son nom des roches volcaniques noires qui couvrent ses collines. On peut y faire des excursions en 4×4, camper sous les étoiles et découvrir des paysages lunaires spectaculaires.", category: cat_dserts },
  { name: "Croisière sur le Nil", sub_category: "Le Nil : Croisière sur le Nil", photo_url: "nile.jpg", address: "Nile River, Luxor to Aswan, Egypt", tags: nil, description: "Les visiteurs peuvent faire une croisière en bateau ou felouque pour relier Louxor à Assouan. C'est une expérience relaxante et culturelle, permettant de découvrir temples, villages et paysages fluviaux tout en profitant du coucher de soleil sur le fleuve.", category: cat_dserts },

  # Les plats typiques — 5 lignes chacun
  { name: "Koshari", sub_category: "Les plats typiques", photo_url: "koshari.jpg", address: "Égypte", tags: "Végétarien,Populaire,Rue",
    description: "Plat national du Caire, le koshari mélange riz, lentilles brunes, macaronis et pois chiches dans un même bol généreux. Il est nappé d'une sauce tomate épicée au cumin et au vinaigre, puis couronné d'oignons frits bien croustillants. Chaque vendeur de rue a sa propre recette secrète transmise de génération en génération. Ce plat végétarien rassasiant est vendu à petits prix dans des échoppes emblématiques à travers toute la ville. C'est le repas du peuple cairote par excellence.", category: cat_plats },

  { name: "Ful Medames", sub_category: "Les plats typiques", photo_url: "ful.jpg", address: "Égypte", tags: "Petit-déjeuner,Traditionnel,Fèves",
    description: "Considéré comme le petit-déjeuner national de l'Égypte, le ful medames est une purée de fèves mijotées pendant de longues heures. Il est assaisonné d'huile d'olive, de jus de citron, d'ail écrasé et de cumin moulu. Servi chaud avec du pain baladi, des œufs durs et des tomates fraîches, il se déguste dans les ruelles animées dès l'aube. L'odeur chaude et réconfortante de ce plat ancestral envahit les quartiers populaires avant le lever du soleil. Un incontournable de la culture culinaire égyptienne.", category: cat_plats },

  { name: "Taameya", sub_category: "Les plats typiques", photo_url: "taameya.jpg", address: "Égypte", tags: "Falafel,Rue,Sandwich",
    description: "Emblème de la street food égyptienne, la taameya se distingue du falafel classique par l'utilisation de fèves fraîches plutôt que de pois chiches. Mélangées à de la coriandre, du persil, de l'ail et des épices, elles sont façonnées en galettes aplaties puis frites jusqu'à obtenir une croûte dorée et croustillante. Servie dans du pain baladi avec de la salade, des tomates, du tahini et des cornichons, elle constitue le petit-déjeuner par excellence du Caire. On la trouve à chaque coin de rue dès les premières heures du matin. Un sandwich simple, savoureux et profondément ancré dans la culture locale.", category: cat_plats },

  { name: "Pain Baladi", sub_category: "Les plats typiques", photo_url: "pain-baladi.jpg", address: "Égypte", tags: "Pain,Traditionnel,Incontournable",
    description: "Le pain baladi est le pain du peuple égyptien, cuit dans des fours traditionnels à très haute température. Cette cuisson lui donne une texture légèrement gonflée, une mie aérée et une croûte fine légèrement dorée. Fabriqué à base de farine complète, il accompagne absolument tous les repas, du petit-déjeuner au dîner. On le retrouve à chaque coin de rue, vendu en piles encore chaudes par des boulangers qui commencent leur journée avant l'aube. Sans lui, ni le ful, ni la taameya, ni la kebda ne seraient complets.", category: cat_plats },

  { name: "Pigeon grillé", sub_category: "Les plats typiques", photo_url: "pigeon.jpg", address: "Égypte", tags: "Viande,Festif,Spécialité",
    description: "Le pigeon grillé est une spécialité égyptienne servie lors des grandes occasions et des repas familiaux festifs. Les pigeons sont soigneusement farcis de freekeh, un blé vert torréfié aux arômes fumés, mélangé à des oignons, des herbes et des épices orientales. Ils sont ensuite rôtis jusqu'à obtenir une peau dorée, croustillante et parfumée. Présenté entier dans l'assiette, ce plat généreux est une fierté de la gastronomie égyptienne. Particulièrement populaire dans les restaurants traditionnels de Louxor et du Caire.", category: cat_plats },

  { name: "Kebda", sub_category: "Les plats typiques", photo_url: "kebda.jpg", address: "Égypte", tags: "Foie,Épicé,Rue",
    description: "Incontournable des grillades de rue égyptiennes, la kebda est préparée à partir de foie de bœuf ou de veau découpé en morceaux. Le foie est mariné dans un mélange généreux de cumin, de piment, d'ail et de poivre noir, puis saisi à feu vif sur une plancha brûlante. Le résultat est une viande fondante aux saveurs fumées et intenses, glissée dans du pain baladi chaud avec des piments verts frits et un filet de citron. Un sandwich emblématique que les Cairotes dégustent à toute heure.", category: cat_plats },

  { name: "Om Ali", sub_category: "Les desserts typiques", photo_url: "om-ali.jpg", address: "Égypte", tags: "Dessert,Chaud,National",
    description: "Considéré comme le dessert national de l'Égypte, l'Om Ali est un pudding chaud et généreux préparé à base de feuilletage trempé dans du lait sucré à la vanille. Il est garni de noix de coco râpée, de raisins secs, d'amandes effilées et de pistaches concassées. Le tout est ensuite gratifié au four jusqu'à obtenir une surface dorée et légèrement croustillante. Servi brûlant dans un plat en terre cuite, ce dessert réconfortant est incontournable dans les restaurants égyptiens. Particulièrement apprécié en hiver pour sa chaleur et sa richesse.", category: cat_plats },

  { name: "Basbousa", sub_category: "Les desserts typiques", photo_url: "basbousa.jpg", address: "Égypte", tags: "Dessert,Semoule,Sucré",
    description: "La basbousa est un gâteau de semoule moelleux cuit au four jusqu'à être bien doré, puis immédiatement imbibé d'un sirop de sucre parfumé à l'eau de rose ou à la fleur d'oranger. Sa texture est à la fois dense et fondante, avec une légère croûte caramélisée en surface. Souvent garnie d'une amande entière au centre de chaque carré, elle est préparée dans toutes les maisons égyptiennes. On la trouve dans chaque pâtisserie du pays et elle se déguste avec un thé à la menthe. Simple mais irrésistible, c'est le symbole du sucré égyptien quotidien.", category: cat_plats },

  { name: "Konafa", sub_category: "Les desserts typiques", photo_url: "konafa.jpg", address: "Égypte", tags: "Dessert,Croustillant,Fromage",
    description: "Reine des pâtisseries orientales, la konafa est préparée à partir de fines vermicelles de pâte kataïfi dorées au beurre. Elle est garnie d'une crème onctueuse au lait ou d'un fromage fondant, puis nappée d'un sirop parfumé à l'eau de rose et à la fleur d'oranger. Croustillante en surface et fondante à l'intérieur, elle se déguste chaude, souvent saupoudrée de pistaches concassées. Au Caire, les meilleures konafas se trouvent dans les pâtisseries traditionnelles du Khan el-Khalili. Un dessert emblématique que tout visiteur doit absolument goûter.", category: cat_plats },

  { name: "Atayef", sub_category: "Les desserts typiques", photo_url: "atayef.jpg", address: "Égypte", tags: "Dessert,Crêpe,Traditionnel",
    description: "Petites crêpes épaisses et moelleuses, les atayef sont une douceur emblématique de la pâtisserie égyptienne. Garnies de noix concassées mélangées à de la cannelle et du sucre, ou d'une crème fraîche légère, elles sont repliées en demi-lune puis frites jusqu'à être bien dorées. Arrosées d'un généreux sirop de sucre parfumé à l'eau de fleur d'oranger, elles se dégustent tièdes dans les rues animées du Caire. Traditionnellement préparées lors du mois de Ramadan, elles font partie intégrante de la culture festive égyptienne. Un incontournable pour les amateurs de douceurs orientales.", category: cat_plats },

].each do |data|
  Place.create!(
    name: data[:name],
    sub_category: data[:sub_category],
    category: data[:category],
    destination_id: egypte.id,
    photo_url: data[:photo_url],
    address: data[:address],
    tags: data[:tags],
    description: data[:description]
  )
end

# TRANSPORTS DANS LE PAYS

Transport.create!(
  name: "Bus de voyage",
  transport_type: "pays",
  destination: egypte,
  advantages: "Très économique\nDessert de nombreuses villes : Le Caire, Alexandrie, Hurghada, Louxor, Assouan, Marsa Alam, Sharm el-Sheikh\nCertaines compagnies privées offrent la climatisation et des sièges confortables\nPlusieurs pauses pendant le trajet (repos, toilettes, nourriture)",
  disadvantages: "Trajets parfois longs, surtout pour les longues distances\nCirculation dense, notamment au Caire et à Alexandrie\nNiveau de confort variable selon la compagnie (il existe de nombreuses compagnies avec des standards différents)\nNombreux contrôles de police sur certaines routes, ce qui peut rallonger le temps de trajet, surtout vers Sharm el-Sheikh, Taba et Nuweiba"
)

Transport.create!(
  name: "Train",
  transport_type: "pays",
  destination: egypte,
  advantages: "Train de nuit disponible pour Louxor et Assouan\nBeaux paysages le long du Nil\nTrains chaque jour, avec plusieurs départs quotidiens vers Alexandrie\nPrix abordable",
  disadvantages: "Retards fréquents\nConfort variable selon la classe (1re, 2e classe, train couchette)\nRéservation parfois compliquée pour les touristes"
)

Transport.create!(
  name: "Avion",
  transport_type: "pays",
  destination: egypte,
  advantages: "Très rapide pour les longues distances (ex. Le Caire – Assouan ou Sharm el-Sheikh, Marsa Alam)\nGain de temps important par rapport au bus ou au train\nConfortable\nIdéal pour relier les villes éloignées en peu de temps",
  disadvantages: "Plus cher que le bus ou le train\nTemps d'attente à l'aéroport (enregistrement et contrôles de sécurité pour passer le rayon X, à l'entrée de l'aéroport, à l'entrée du terminal avant l'enregistrement, à la sortie du terminal et contrôle de police)\nLimitation de bagages selon le type de billet\nFormalités et contrôles multiples qui peuvent rallonger la durée totale du voyage"
)

Transport.create!(
  name: "Louer une voiture",
  transport_type: "pays",
  destination: egypte,
  advantages: "Grande liberté de déplacement et flexibilité d'horaires\nPratique pour explorer les zones rurales, le désert ou des sites touristiques éloignés\nPossibilité de s'arrêter où et quand on le souhaite\nIdéal pour les voyages en groupe ou en famille",
  disadvantages: "Conduite difficile dans les grandes villes comme Le Caire ou Alexandrie (trafic dense, circulation chaotique)\nRègles de circulation parfois peu respectueuses, prudence obligatoire\nCoûts supplémentaires : essence, péages, assurance\nBesoin d'un permis de conduire valide et parfois d'une traduction officielle pour les touristes\nNombreux contrôles de police sur certaines routes, ce qui peut rallonger le temps de trajet, surtout vers Sharm el-Sheikh, Taba et Nuweiba"
)

# TRANSPORTS DANS LES VILLES

Transport.create!(
  name: "Bus urbain",
  transport_type: "villes",
  destination: egypte,
  advantages: "Très économique\nLarge couverture dans la ville et ses banlieues\nPlusieurs compagnies offrent la climatisation sur certaines lignes",
  disadvantages: "Circulation dense dans les grandes villes, surtout au Caire et Alexandrie\nTrajets parfois longs en heures de pointe\nNiveau de confort variable selon la compagnie et le bus"
)

Transport.create!(
  name: "Métro",
  transport_type: "villes",
  destination: egypte,
  advantages: "Rapide pour traverser uniquement au Caire\nÉvite les embouteillages\nTarif très abordable\nFréquent et fiable pour les trajets urbains principaux",
  disadvantages: "Surchargé aux heures de pointe\nPeu de lignes, couvre surtout le centre-ville et certaines banlieues\nPeu pratique pour rejoindre certains quartiers ou zones touristiques éloignées"
)

Transport.create!(
  name: "Tram",
  transport_type: "villes",
  destination: egypte,
  advantages: "Principalement disponible à Alexandrie\nMoyen de transport stable et sûr\nPrix très abordable\nOffre un trajet agréable le long de certaines avenues et du bord de mer",
  disadvantages: "Réseau limité à certaines zones\nMoins rapide que le métro ou le bus en heures de pointe\nVieillissement des infrastructures sur certaines lignes"
)

Transport.create!(
  name: "Louer une voiture",
  transport_type: "villes",
  destination: egypte,
  advantages: "Grande liberté de déplacement et flexibilité d'horaires\nPratique pour visiter la ville et ses environs à son rythme\nPossibilité de s'arrêter où on veut\nUtile aussi pour les voyages à l'intérieur du pays, entre différentes villes ou sites touristiques",
  disadvantages: "Conduite difficile dans les grandes villes comme Le Caire ou Alexandrie (trafic dense, circulation chaotique)\nRègles de circulation parfois peu respectées\nCoûts supplémentaires : essence, péages, assurance\nBesoin d'un permis de conduire valide et parfois traduction officielle pour les touristes\nNombreux contrôles de police sur certaines routes, ce qui peut rallonger le temps du trajet"
)

Transport.create!(
  name: "Taxi",
  transport_type: "villes",
  destination: egypte,
  advantages: "Facilement disponible dans la plupart des villes\nPratique pour des trajets courts ou rapides\nPas besoin de se soucier de la conduite ou du stationnement",
  disadvantages: "Tarifs parfois variables, négociation souvent nécessaire\nCertains taxis n'ont pas de compteur ou le chauffeur n'active pas, il faut donc négocier le prix avant le départ\nCirculation dense dans les grandes villes peut rallonger les trajets\nConfort limité selon le véhicule"
)

Transport.create!(
  name: "Uber",
  transport_type: "villes",
  destination: egypte,
  advantages: "Tarif fixe visible avant le trajet\nPlus sûr et plus pratique que le taxi classique\nPaiement possible par application, pas besoin d'argent liquide\nVéhicules souvent plus récents et confortables",
  disadvantages: "Disponible surtout dans les grandes villes (Le Caire, Alexandrie)\nPlus cher qu'un taxi traditionnel classique\nTrajets ralentis en cas de trafic dense\nDépendance à la couverture réseau et à l'application mobile"
)

puts "Seeds terminés avec succès !"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
puts "Cleaning Database..."

User.destroy_all
Venue.destroy_all
Tag.destroy_all

puts "Database cleaned!"
puts "------------------"
puts "Generating seeds..."

puts "Generating tags..."

# //////////////////// Tags /////////////////
[
  "action",
  "activité",
  "boisson",
  "cinéma",
  "comedie",
  "comptoir",
  "conférence",
  "couple",
  "culture",
  "danse",
  "documentaire",
  "drame",
  "dynamique",
  "electro",
  "exposition",
  "gratuit / prix libre",
  "groupe",
  "hip-Hop",
  "horreur",
  "humour",
  "jazz",
  "latino",
  "musical",
  "musique",
  "musiques du monde",
  "one-man-show",
  "payant",
  "posée",
  "regarder",
  "rock",
  "dessins animés",
  "science-fiction",
  "social",
  "solo",
  "soul",
  "sportif",
  "théâtre",
  "tranquille",
].each do |name|
  Tag.create!(name: name)
end

puts "Generating conversion words..."

# ////////////// Conversion words ///////////
ConversionWord.create!(name: "thriller", tag: Tag.find_by(name: "horreur"))
ConversionWord.create!(name: "epouvante", tag: Tag.find_by(name: "horreur"))
ConversionWord.create!(name: "epouvante-horreur", tag: Tag.find_by(name: "horreur"))
ConversionWord.create!(name: "comedie-dramatique", tag: Tag.find_by(name: "drame"))
ConversionWord.create!(name: "fantastique", tag: Tag.find_by(name: "science-fiction"))
ConversionWord.create!(name: "aventure", tag: Tag.find_by(name: "action"))
ConversionWord.create!(name: "film-d-animation", tag: Tag.find_by(name: "dessins animés"))


puts "Generating venues..."
# /////////////////// Venues ////////////////
event_tags = {}
# generic bar
zygobar = Venue.create!(name: "Le Zygobar", kind: "bar", address: "35 rue des Olivettes, 44000 Nantes", url: "https://www.facebook.com/zygo.bar/", photo: File.open(Rails.root.join('db/fixtures/venues/zygobar.jpg')), phone_number: '02 51 83 51 34') # jazz, culture, bar à ambiance, theme
event_tags[zygobar.id] = ["posée", "social", "comptoir", "musique", "jazz"]

be2m = Venue.create!(name: "Bé2M", kind: "bar", address: "32 bis rue Fouré, 44000 Nantes", url: "https://www.lafourchette.com/restaurant/be2m/391641?cc=15284-c78", photo: File.open(Rails.root.join('db/fixtures/venues/be2m.jpg')), phone_number: '02 51 83 51 34') # bar à vin, tapas, posé, manger un bout
event_tags[be2m.id] = ["posée", "social", "comptoir", "boisson"]

santeuil = Venue.create!(name: "Santeuil Café", kind: "bar", address: "5 rue Santeuil, 44000 Nantes", url: "https://www.instagram.com/santeuilcafe/?utm_source=ig_embed", photo: File.open(Rails.root.join('db/fixtures/venues/santeuil.jpg')), phone_number: '02 51 83 51 34') # bar à cocktail, soirée blind test tous les derniers mercredi du mois
event_tags[santeuil.id] = ["posée", "social", "comptoir", "boisson"]

cantine_du_voyage = Venue.create!(name: "La Cantine du Voyage", kind: "bar", address: "Quai des Antilles, 44000 Nantes", url: "https://www.levoyageanantes.fr/etapes/la-cantine-du-voyage-2/", photo: File.open(Rails.root.join('db/fixtures/venues/cantine_voyage.jpg')), phone_number: '02 51 83 51 34') # lifestyle, jouer, ouverte uniquement du 04/04/2019 au 13/10/2019
event_tags[cantine_du_voyage.id] = ["posée", "social", "comptoir", "boisson", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

bubar = Venue.create!(name: "Le Bubar", kind: "bar", address: "5 rue Louis Blanc, 44200 Nantes", url: "https://www.facebook.com/bubarnantes/", photo: File.open(Rails.root.join('db/fixtures/venues/bubar.jpg')), phone_number: '02 51 83 51 34') # bar à bières,
event_tags[bubar.id] = ["posée", "social", "comptoir", "boisson"]

nid = Venue.create!(name: "Le Nid", kind: "bar", address: "Tour de Bretagne, Place de Bretagne, 44047 Nantes", url: "https://www.facebook.com/LeNidNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/le_nid.jpg')), phone_number: '02 51 83 51 34') # rooftop, lounge, concerts
event_tags[nid.id] = ["posée", "social", "comptoir", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

vertigo = Venue.create!(name: "Le Vertigo", kind: "bar", address: "3 mail du Front Populaire, 44200 Nantes", url: "https://www.facebook.com/VertigoNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/vertigo.jpg')), phone_number: '02 51 83 51 34') # bar, rooftop, plusieurs ambiances
event_tags[vertigo.id] = ["posée", "social", "comptoir", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

bateau_lavoir = Venue.create!(name: "Le Bateau Lavoir", kind: "bar", address: "Quai Ceineray, 44000 Nantes", url: "https://www.facebook.com/bateaulavoirNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/lavoir.jpg')), phone_number: '02 51 83 51 34') # péniche, guinguette
event_tags[bateau_lavoir.id] = ["posée", "social", "comptoir"]

corneille = Venue.create!(name: "Le Corneille", kind: "bar", address: "24 rue Scribe, 44000 Nantes", url: "http://www.aperorestodisco.com/bar-nantes-9629-le-corneille.html", photo: File.open(Rails.root.join('db/fixtures/venues/corneille.jpg')), phone_number: '02 51 83 51 34') # bar classique
event_tags[corneille.id] = ["posée", "social", "comptoir"]

berlin1989 = Venue.create!(name: "Berlin 1989", kind: "bar", address: "95 bd Gabriel Lauriol, 44300 Nantes", url: "https://berlin1989.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/berlin.jpg')), phone_number: '02 51 83 51 34') #bar à thème, manger un bout, espace extérieur
event_tags[berlin1989.id] = ["posée", "social", "comptoir"]

labo = Venue.create!(name: "Le Labo", kind: "bar", address: "19 rue Léon Blum, 44000 Nantes", url: "http://www.lelabo-nantes.com/", photo: File.open(Rails.root.join('db/fixtures/venues/labo.jpg')), phone_number: '02 51 83 51 34') # bar à cocktails
event_tags[labo.id] = ["posée", "social", "comptoir", "boisson"]

lieu_unique = Venue.create!(name: "Le Lieu Unique", kind: "bar", address: "2 rue de la biscuiterie, 44000 Nantes", url: "", photo: File.open(Rails.root.join('db/fixtures/venues/lieu.jpg')), phone_number: '02 51 83 51 34') #bar ambiance, culture, manger un bout
event_tags[lieu_unique.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre", "social", "culture"]

kolocs = Venue.create!(name: "Les Koloc's", kind: "bar", address: "59 Quai de la Fosse, 44000 Nantes", url: "https://www.facebook.com/kolocs/", photo: File.open(Rails.root.join('db/fixtures/venues/kolocs.jpg')), phone_number: '02 51 83 51 34') #bar ambiance, faire la fête
event_tags[kolocs.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

chat_noir = Venue.create!(name: "Le Chat Noir", kind: "bar", address: "13 allée Duguay-TROUIN, 44000 Nantes", url: "http://www.chat-noir-nantes.fr", photo: File.open(Rails.root.join('db/fixtures/venues/chat_noir.jpg')), phone_number: '06 61 68 66 20')
event_tags[chat_noir.id] = ["posée", "social", "comptoir", "musique", "rock", "musiques du monde"]

chien_stupide = Venue.create!(name: "Le Chien Stupide", kind: "bar", address: "4 Rue des Carmélites, 44000 Nantes", url: "https://www.facebook.com/auchienstupide/", photo: File.open(Rails.root.join('db/fixtures/venues/chien_stupide.jpg')), phone_number: '02 40 20 58 39')
event_tags[chien_stupide.id] = ["posée", "social", "comptoir", "musique", "rock"]

scene_michelet = Venue.create!(name: "La Scène Michelet", kind: "bar", address: "1 Boulevard Henry Orrion, 44000 Nantes", url: "http://www.scenemichelet.com/", photo: File.open(Rails.root.join('db/fixtures/venues/scene_michelet.jpg')), phone_number: '02 40 74 13 13')
event_tags[scene_michelet.id] = ["posée", "social", "comptoir", "musique", "rock", "dynamique", "gratuit / prix libre", "payant"]

prohibition = Venue.create!(name: "Prohibition", kind: "nightclub", address: "7 rue de la Baclerie, 44000 Nantes", url: "http://barprohibition.com/", photo: File.open(Rails.root.join('db/fixtures/venues/prohibition.jpg')), phone_number: '02 40 47 14 00')
event_tags[prohibition.id] = ["posée", "social", "comptoir", "musique", "hip-Hop", "electro" "dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

altercafe = Venue.create!(name: "Altercafé", kind: "nightclub", address: "21 quai des Antilles - Ile de Nantes, 44200", url: "http://altercafe.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/altercafe.jpg')), phone_number: '02 28 20 01 06')
event_tags[altercafe.id] = ["posée", "social", "comptoir", "musique", "hip-Hop", "electro", "dynamique", "solo", "groupe", "musique", "payant", "gratuit / prix libre"]

havana = Venue.create!(name: "Havana-café", kind: "bar", address: "2 rue de la Juiverie, Quartier Bouffay, 44000 Nantes", url: "http://www.havana-cafe-nantes.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/havana.jpg')), phone_number: '07 82 52 30 15')
event_tags[havana.id] = ["posée", "social", "comptoir", "latino", "boisson", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

la_calle = Venue.create!(name: "La Calle", kind: "bar", address: "21 Quai des Antilles à Nantes, 44200 Nantes", url: "http://www.barlacalle.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/la_calle.jpg')), phone_number: '02 51 82 72 18')
event_tags[la_calle.id] = ["latino", "boisson", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

el_latino = Venue.create!(name: "El Latino", kind: "bar", address: "1 rue Marie Curie, Saint-Sébastien-sur-Loire", url: "http://www.el-latino.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/el_latino.jpg')), phone_number: '02 51 79 03 67')
event_tags[el_latino.id] = ["latino", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

melocotton = Venue.create!(name: "Melocotton", kind: "bar", address: "9, rue de l'heronnière, 44000 Nantes", url: "https://www.facebook.com/melocottoncafeconcert/", photo: File.open(Rails.root.join('db/fixtures/venues/melocotton.jpg')), phone_number: '09 53 30 50 81')
event_tags[melocotton.id] = ["posée", "social", "comptoir", "musique", "jazz"]

triolet = Venue.create!(name: "Le Triolet", kind: "bar", address: "8, rue de l'hermitage, 44100 Nantes", url: "https://www.facebook.com/letriolet/", photo: File.open(Rails.root.join('db/fixtures/venues/triolet.jpg')), phone_number: '02 40 69 32 30')
event_tags[triolet.id] = ["posée", "social", "comptoir", "musique", "jazz", "musiques du monde"]

ferrailleur = Venue.create!(name: "Le Ferrailleur", kind: "bar", address: "Quai des Antilles, 44200 Nantes", url: "http://www.leferrailleur.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/ferrailleur.jpg')), phone_number: '02 52 10 45 25')
event_tags[ferrailleur.id] = ["musique", "rock", "dynamique", "gratuit / prix libre", "payant", "musiques du monde", "hip-Hop"]

aux_ptits_joueurs = Venue.create!(name: "Aux Ptits Joueurs", kind: "bar", address: "23 Rue du Port Guichard 44000 Nantes", url: "https://www.facebook.com/ptitsjoueurs/", photo: File.open(Rails.root.join('db/fixtures/venues/petits.jpg')), phone_number: '02 51 83 51 34') # typique/traditionnel, boule nantaise, boire, manger un bout, concert, jeux
event_tags[aux_ptits_joueurs.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre", "activité", "tranquille", "posée", "social", "comptoir", "musique"]

# generic nightclub
macadam = Venue.create!(name: "Macadam", kind: "nightclub", address: "17 rue Jules Launay - Nantes", url: "https://www.facebook.com/macadam.nantes/", photo: File.open(Rails.root.join('db/fixtures/venues/macadam.jpg')), phone_number: '02 51 83 51 34') # danser, se défouler, club, électro
event_tags[macadam.id] = ["dynamique", "solo", "groupe", "musique", "payant", "electro"]

# generic activity
bowl_center = Venue.create!(name: "BowlCenter", kind: "bowling", address: "151 Rue du Moulin de la Rousselière, 44800 Saint-Herblain", url: "https://nantes.bowlcenter.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/bowl.jpg')), phone_number: '02 51 83 51 34') # activité, groupe, posé
event_tags[bowl_center.id] = ["dynamique", "groupe", "activité", "tranquille"]

eurobowl = Venue.create!(name: "Eurobowl Saint Sébastien sur Loire", kind: "bowling", address: "27 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "www.eurobowl.fr/saint-sebastien/", photo: File.open(Rails.root.join('db/fixtures/venues/eurobowl.jpg')), phone_number: '02 51 83 51 34') #manger un bout, jeux, en groupe
event_tags[eurobowl.id] = ["dynamique", "groupe", "activité", "tranquille"]

tadam_escape = Venue.create!(name: "TADAM Escape", kind: "escape game", address: " 14 Rue de l'Hôtellerie, Carquefou, France ", url: "http://tadamescape.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/tadam.jpg')), phone_number: '02 51 83 51 34') #activité, sensations, aventure, groupe
event_tags[tadam_escape.id] = ["dynamique", "groupe", "activité", "tranquille"]

onirium = Venue.create!(name: "Onirium", kind: "escape game", address: " 34 Bis Boulevard Gabriel Guist’hau 44000 Nantes", url: "https://lonirium.com/", photo: File.open(Rails.root.join('db/fixtures/venues/onirium.jpg')), phone_number: '02 51 83 51 34') #aventure, activité, groupe
event_tags[onirium.id] = ["dynamique", "groupe", "activité", "tranquille"]

patinoire_petit_port = Venue.create!(name: "La patinoire du Petit Port", kind: "patinoire", address: "Boulevard du Petit Port, 44300 Nantes", url: "https://www.patinoire-nantes.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/patinoire.jpg')), phone_number: '02 51 83 51 34') # activité, groupe, dynamique, sportif, glisse
event_tags[patinoire_petit_port.id] = ["dynamique", "groupe", "activité", "sportif"]

city_kart = Venue.create!(name: "City Kart", kind: "karting", address: "33 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "https://www.city-kart.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/kart.jpg')), phone_number: '02 51 83 51 34') # activité, groupe, dynamique
event_tags[city_kart.id] = ["dynamique", "groupe", "activité", "sportif"]

lasergame_evolution = Venue.create!(name: "Lasergame Evolution", kind: "lasergame", address: "3 Rue des Piliers de la Chauvinière, 44800 Saint-Herblain", url: "https://www.lasergame-evolution.com/fr/102/Nantes%20St-Herblain/", photo: File.open(Rails.root.join('db/fixtures/venues/laser.jpg')), phone_number: '02 51 83 51 34') # activité, groupe, dynamique, intense
event_tags[lasergame_evolution.id] = ["dynamique", "groupe", "activité", "sportif"]


puts "Generating generic events..."
# /////////////////// Generic Events /////////22///////

ferrailleur_event = Event.create!(
  price: 0,
  name: "Soirée à Le Triolet",
  category: "Bar",
  venue: ferrailleur,
  beginning_hour: '17:00',
  end_hour: '02:00',
  description: "Le Ferrailleur a été créé en 2007 sur le site du Hangar 21, mieux connu sous le nom du « Hangar à Bananes » construit après la
              première guerre mondiale, lorsque le commerce de la banane était en plein essor. Depuis son ouverture, le café-concert nantais est
              rapidement devenu une référence de la scène rock/metal française. En effet l’équipe du Ferrailleur poursuit le pari d’un lieu dédié
              à la découverte et à la diversité au travers d’une programmation éclectique : Rock, Metal, Electro, Hiphop, post rock… ",
  url: ferrailleur.url
)

event_tags[ferrailleur.id].each do |tag_name|
  EventTag.create!(
    event: ferrailleur_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

triolet_event = Event.create!(
  price: 0,
  name: "Soirée à Le Triolet",
  category: "Bar",
  venue: triolet,
  beginning_hour: '17:00',
  end_hour: '02:00',
  description: "Le Triolet possède assurément l'une des meilleures vues de Nantes. A l'intérieur, les murs de pierre soulignent le côté
            authentique de ce bistrot, où de nombreux concerts ont lieu. A votre disposition deux salles, une plutôt pub, et l'autre plus
            intimiste avec poufs et tables basses. Diffusion d'événements sportifs, football, rugby ou moto. La carte vous propose des
            bières du Québec, des pressions pures malt et une multitude de shooters.",
  url: triolet.url
)

event_tags[triolet.id].each do |tag_name|
  EventTag.create!(
    event: triolet_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

melocotton_event = Event.create!(
  price: 0,
  name: "Soirée au Melocotton",
  category: "Bar",
  venue: melocotton,
  beginning_hour: '16:00',
  end_hour: '02:00',
  description: "Le Melocotton est un café-concert très riche puisque la programmation s’étend quasiment sur toute la semaine. Le mardi une
              JAM session est organisée. Tous les mercredi c’est soirée poker.Le Melocotton Nantes est un café-concert comme on en trouve peu
              sur Nantes! Situé derrière Graslin. Importante gamme de vins, bières, de rhums mais aussi de whiskies pour les plus costauds!",
  url: melocotton.url
)

event_tags[melocotton.id].each do |tag_name|
  EventTag.create!(
    event: melocotton_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

melocotton_event = Event.create!(
  price: 0,
  name: "Soirée au Melocotton",
  category: "Bar",
  venue: melocotton,
  beginning_hour: '16:00',
  end_hour: '02:00',
  description: "Le Melocotton est un café-concert très riche puisque la programmation s’étend quasiment sur toute la semaine. Le mardi une
              JAM session est organisée. Tous les mercredi c’est soirée poker.Le Melocotton Nantes est un café-concert comme on en trouve peu
              sur Nantes! Situé derrière Graslin. Importante gamme de vins, bières, de rhums mais aussi de whiskies pour les plus costauds!",
  url: melocotton.url
)

event_tags[melocotton.id].each do |tag_name|
  EventTag.create!(
    event: melocotton_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

el_latino_event = Event.create!(
  price: 0,
  name: "Soirée @ El Lation",
  category: "Bar",
  venue: el_latino,
  beginning_hour: '18:00',
  end_hour: '04:00',
  description: "Ce café cubain vous accueille depuis 2009 à Saint-Sebastien sur Loire! Cours de Salsa/Bachata/Kizomba la semaine,
              ambiance déjantée le week-end: Tenue correcte exigée, esprit festif obligatoire! Cocktails classiques avec notamment plusieurs
              déclinaisons de l'inévitable mojito ou glacés, avec ou sans alcool, vieux rhums, bières, softs...",
  url: el_latino.url
)

event_tags[el_latino.id].each do |tag_name|
  EventTag.create!(
    event: el_latino_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

la_calle_event = Event.create!(
  price: 0,
  name: "Soirée @ La Calle",
  category: "Bar",
  venue: la_calle,
  beginning_hour: '18:00',
  end_hour: '04:00',
  description: "Ce café cubain installé au Hangar à Bananes sur l'île de Nantes est un bon remède contre la morosité. Décoration exotique,
              terrasse avec vue sur la Loire à travers les bambous et autres plantes vertes. Une bonne adresse pour faire une pause dépaysante
              dans l'après-midi et se déhancher le soir. Cocktails classiques avec notamment plusieurs déclinaisons de l'inévitable mojito ou
              glacés, avec ou sans alcool, vieux rhums, bières, softs...",
  url: la_calle.url
)

event_tags[la_calle.id].each do |tag_name|
  EventTag.create!(
    event: la_calle_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

havana_event = Event.create!(
  price: 0,
  name: "Soirée au Havana Café",
  category: "Bar",
  venue: havana,
  beginning_hour: '18:00',
  end_hour: '04:00',
  description: " Bienvenue au Havana Café, le bar Salsa 100% latino à Nantes! Le Havana Café de Nantes, c'est 2 bars deux ambiances dj Mix 7/7
              dans une belle salle cubaine doublé d'un sous-sol en cave voûtée de pierres apparentes pour vous accueillir dans une ambiance
              unique rythmée au son des musiques latines. Venez déguster nos fameux cocktails et spécialités du bar Havana Café : mojito,
              cuba libre et rhums du monde...",
  url: havana.url
)

event_tags[havana.id].each do |tag_name|
  p tag_name
  EventTag.create!(
    event: havana_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

altercafe_event = Event.create!(
  price: 0,
  name: "Soirée au Altercafé",
  category: "Nightclub",
  venue: altercafe,
  beginning_hour: '15:00',
  end_hour: '04:00',
  description: "Niché dans le Hangar à Bananes de Nantes, l’Altercafé est devenu un des rendez-vous nantais pour les amateurs et initiés de
              concerts et clubs. Scène entièrement refaite, lightshows de pointe, concerts live et programmation variée ont fait de cet endroit
              hybride et polyvalent un lieu d’expression, de rencontre et d’ouverture. On le sait, les directeurs artistiques (DA) travaillent
              d’arrache-pied pour vous offrir les meilleurs plateaux",
  url: altercafe.url
)

event_tags[altercafe.id].each do |tag_name|
  EventTag.create!(
    event: altercafe_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

prohibition_event = Event.create!(
  price: 0,
  name: "Soirée au Prohibition",
  category: "Bar Clandestin",
  venue: prohibition,
  beginning_hour: '18:00',
  end_hour: '03:00',
  description: "En plein cœur de Bouffay, le Prohibition séduit les amateurs de sport à l’heure de l’apéro et poursuit la fête jusqu’au petit
              matin sur sa piste de danse. Un incontournable à fréquenter sans modération. Le Prohibition s’inspire des bars clandestins de la
              fameuse époque éponyme où l’alcool était interdit aux Etats-Unis. Des briques rouges jusqu’aux cocktails le Prohib’ nous entraine
              dans les rues de New-York.",
  url: prohibition.url
)

event_tags[prohibition.id].each do |tag_name|
  EventTag.create!(
    event: prohibition_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

scene_michelet_event = Event.create!(
  price: 0,
  name: "Soirée Au Chien Stupide",
  category: "Bar Rock",
  venue: scene_michelet,
  beginning_hour: '17:00',
  end_hour: '02:00',
  description: "Depuis 2007 nous avons transformé cette vieille bâtisse, et au fur et à mesure des années, La Scène Michelet s'est offert une
              nouvelle jeunesse. Dans le quartier, le lieu a su se faire accepter et c'est désormais une salle à part entière, marquée par sa
              forte identité Rock, incarnée par sa devanture impressionnante réalisée par le collectif Eta Sigma. C'est avec plaisir et fierté
              que nous vous accueillons dans nos 3 espaces : le bar (avec ses 10 bières à la pression), la salle de concert et la terrasse.
              Celle-ci est en partie couverte, un espace tranquille et agréable qui fait l’unanimité des habitués du lieu.",
  url: scene_michelet.url
)

event_tags[scene_michelet.id].each do |tag_name|
  EventTag.create!(
    event: scene_michelet_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

chien_stupide_event = Event.create!(
  price: 0,
  name: "Soirée Au Chien Stupide",
  category: "Bar Rock",
  venue: chien_stupide,
  beginning_hour: '11:00',
  end_hour: '02:00',
  description: "Au Chien Stupide c’est surtout un bar à l’ambiance décontractée où tout le monde se sent à l’aise. La déco est sympa, très
              colorée, la carte écrite à la craie sur le mur est certes un peu difficile à déchiffrer mais vraiment originale! Le bar est
              fréquenté principalement par des étudiants, mais pourtant jeunes et moins jeunes se mélangent parfaitement, créant ainsi une
              atmosphère très conviviale.",
  url: chien_stupide.url
)

event_tags[chien_stupide.id].each do |tag_name|
  EventTag.create!(
    event: chien_stupide_event,
    tag: Tag.find_by!(name: tag_name)
  )
end


zygobar_event = Event.create!(
  price: 0,
  name: "Soirée au Zygobar",
  category: "Bar-Café Culturel",
  venue: zygobar,
  beginning_hour: '18:00',
  end_hour: '02:00',
  description: "Le Zygo Bar vous fait (re)découvrir l’âme des vrais cafés-concerts! Vous y trouverez tout le nécessaire pour vous détendre:
                un cadre convivial et chaleureux, bières et vins de qualité, une terrasse couverte pour prendre l’air… et un concert quasiment
                tous les soirs! Le «Zygo» est situé au 35 rue des Olivettes (quartier Madeleine/Champ de Mars) et est ouvert du mardi au samedi
                de 17h à 2h du matin. Les concerts sont généralement en entrée libre la semaine et payants le week-end (de 4€ à 6€).",
  url: zygobar.url
)

event_tags[zygobar.id].each do |tag_name|
  EventTag.create!(
    event: zygobar_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

be2m_event = Event.create!(
  price: 0,
  name: "Soirée au Bé2M",
  category: "Bar à vins",
  venue: be2m,
  beginning_hour: '18:00',
  end_hour: '01:00',
  description: "Situé à 5 minutes à pied du château des Ducs de Bretagne, le Bé2M est un restaurant, bar et cave à vins idéal pour voyager dans
              une ambiance jazzy et chaleureuse. Ici, les produits d’excellence composant nos planches ou nos assiettes sont mis à l’honneur et
              les vins sont sélectionnés avec soin par Mathieu, propriétaire et sommelier des lieux.
              Que ce soit pour boire un verre en musique ou déguster une assiette, le Bé2M est un autre lieu unique.",
  url: be2m.url
)

event_tags[be2m.id].each do |tag_name|
  EventTag.create!(
    event: be2m_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

santeuil_event = Event.create!(
  price: 0,
  name: "Soirée au Santeuil",
  category: "Bar à cocktail",
  venue: santeuil,
  beginning_hour: '16:00',
  end_hour: '02:00',
  description: "Un café de quartier très sympathique qui propose des cocktails fruités ainsi que des soirées avec DJ et de la musique festive.
              Vous pouvez y passer une soirée détendue et sans soucis, le bar ferme à 2h du matin. Vous pouvez même grignoter de délicieux tapas!",
  url: santeuil.url
)

event_tags[santeuil.id].each do |tag_name|
  EventTag.create!(
    event: santeuil_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

cantine_du_voyage_event = Event.create!(
  price: 0,
  name: "Soirée à La Cantine du Voyage",
  category: "Bar éphémère",
  venue: cantine_du_voyage,
  beginning_hour: '12:00',
  end_hour: '24:00',
  description: "Lieu de villégiature des Nantais, espace éphémère surprenant et convivial pour les visiteurs qui la découvrent, La Cantine du
                Voyage est devenue une étape incontournable du Voyage à Nantes avec son espace de restauration de 300 couverts,
                son très grand bar, ses baby-foot, son terrain de pétanque et sa librairie-boutique.",
  url: cantine_du_voyage.url
)

event_tags[cantine_du_voyage.id].each do |tag_name|
  EventTag.create!(
    event: cantine_du_voyage_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

bubar_event = Event.create!(
  price: 0,
  name: "Soirée au Bubar",
  category: "Bar microbrasserie",
  venue: bubar,
  beginning_hour: '17:00',
  end_hour: '02:00',
  description: "Le Bubar est un bar microbrasserie, située quartier République à Nantes. Les bières maison du Bubar sont artisanales, non
              filtrées et non pasteurisées! Bien sûr, planches apéro avec le saucisson au mètre et autre encas sont de la partie. Une bonne
              musique, des concerts, des retransmissions sportives, le canapé, les jeux de fléchettes, tout est fait pour se sentir chez soi.",
  url: bubar.url
)

event_tags[bubar.id].each do |tag_name|
  EventTag.create!(
    event: bubar_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

nid_event = Event.create!(
  price: 0,
  name: "Soirée @ Le Nid",
  category: "Bar rooftop",
  venue: nid,
  beginning_hour: '14:00',
  end_hour: '02:00',
  description: "Perché au sommet de la Tour Bretagne, le Nid a pris son envol en juin 2012. Etape majeure du Voyage à Nantes,
              l’œuvre-bar onirique imaginée par le Nantais Jean Jullien offre une vue imprenable sur Nantes et invite l’imaginaire.
              Avec plus d’1,8 million de visiteurs depuis son ouverture, le Nid est l’un des toits-terrasses les plus prisés de France.",
  url: nid.url
)

event_tags[nid.id].each do |tag_name|
  EventTag.create!(
    event: nid_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

vertigo_event = Event.create!(
  price: 0,
  name: "Soirée @ Le Vertigo",
  category: "Bar rooftop",
  venue: vertigo,
  beginning_hour: '12:00',
  end_hour: '02:00',
  description: "Le Vertigo vous accueille dans une ambiance conviviale pour profiter de la vue imprenable sur la Cité des Ducs au coucher du
                soleil, autour d’un verre ou d’un repas alliant raffinement et plaisir. Venez déguster nos cocktails maison qui agiteront vos
                papilles dans une ambiance musicale chaleureuse et éclectique, la tête dans les nuages.",
  url: vertigo.url
)

event_tags[vertigo.id].each do |tag_name|
  EventTag.create!(
    event: vertigo_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

bateau_lavoir_event = Event.create!(
  price: 0,
  name: "Soirée @ Bateau-Lavoir",
  category: "Bar rooftop",
  venue: bateau_lavoir,
  beginning_hour: '16:00',
  end_hour: '22:30',
  description: "Le Bateau-lavoir est une guinguette du centre-ville de Nantes où l’on peut aller tous les jours pour se faire du bien au
              moral et aux yeux. L’accent est mis sur la créativité à travers les concerts, les expositions, les spectacles de cabaret,
              les rencontres avec des vignerons et la consommation responsable et à petite échelle.",
  url: bateau_lavoir.url
)

event_tags[bateau_lavoir.id].each do |tag_name|
  EventTag.create!(
    event: bateau_lavoir_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

corneille_event = Event.create!(
  price: 0,
  name: "Soirée @ Bateau-Lavoir",
  category: "Bar rooftop",
  venue: corneille,
  beginning_hour: '16:00',
  end_hour: '02:00',
  description: "Cocktails sur-mesure, snacking généreux de midi à minuit, long happy hours, ambiance musicale et festive. Un intérieur
                original mêlant pierres de taille apparentes et décoration contemporaine. Une agréable terrasse, chauffée en hiver, au
                calme d'une rue piétonne pavée. Un service efficace et aux petits oignons.",
  url: corneille.url
)

event_tags[corneille.id].each do |tag_name|
  EventTag.create!(
    event: corneille_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

berlin1989_event = Event.create!(
  price: 0,
  name: "Soirée au Berlin1989",
  category: "Bar d’inspiration teutonne",
  venue: berlin1989,
  beginning_hour: '11:30',
  end_hour: '01:00',
  description: "Le Bistro Berlin 1989 est un lieu en hommage à cette capitale dont nous kiffons le fouillis, l’âme, la cuisine et la bière,
              sans tomber dans le piège de la hype et des stéréotypes. A la fois biergarten & restaurant, nous avons imaginé un rêve, pour
              vous et pour nous. Une brasserie différente et militante, il fallait rentrer en France pour raconter ça.",
  url: berlin1989.url
)

event_tags[berlin1989.id].each do |tag_name|
  EventTag.create!(
    event: berlin1989_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

labo_event = Event.create!(
  price: 0,
  name: "Soirée @ Le Labo",
  category: "Bar-rhumerie",
  venue: labo,
  beginning_hour: '18:00',
  end_hour: '02:00',
  description: "Un bar rhumerie qui propose un large choix de cocktails servis dans des tubes à essai, des béchers et autres verres de laboratoire.
              Aux beaux jours, une terrasse est dressée pour profiter du soleil. Une bonne adresse pour boire un verre dans cette rue Léon Blum un
              tantinet à l'écart du centre, mais riche en lieux et en ambiances.",
  url: labo.url
)

event_tags[labo.id].each do |tag_name|
  EventTag.create!(
    event: labo_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

lieu_unique_event = Event.create!(
  price: 0,
  name: "Soirée @ Le Lieu Unique",
  category: "Bar d’exploration artistique",
  venue: lieu_unique,
  beginning_hour: '18:00',
  end_hour: '02:30',
  description: "Au bord du canal Saint-Félix, l’ex-usine LU revit depuis l'anné 2000 au rythme d’un centre d’arts atypique. Scène nationale de
              Nantes, le lieu unique est un espace d’exploration artistique, de bouillonnement culturel et de convivialité qui mélange
              les genres, les cultures et les publics. Son credo : l’esprit de curiosité dans les différents domaines de l’art, le lieu unique
              abrite à côté de ces espaces dédiés à la création, un ensemble de services : bar, restaurant, librairie, hammam, crèche… ",
  url: lieu_unique.url
)

event_tags[lieu_unique.id].each do |tag_name|
  EventTag.create!(
    event: lieu_unique_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

kolocs_event = Event.create!(
  price: 0,
  name: "Soirée @ Les Kolocs",
  category: "Bar Ambiance",
  venue: kolocs,
  beginning_hour: '18:00',
  end_hour: '02:00',
  description: "Quand vous passerez sur le quai de la Fosse à Nantes, poussez la porte des Koloc’s. On vous assure que vous ne le regretterez pas!
              Ici, on est accueilli dans un décor fait de bois, de tags sur les murs et de lumières tamisées. Un mélange d’inspirations qui
              confère énormément de chaleur au lieu! L’autre atout des Koloc’s? Sa terrasse qui fait office de coin fumeur et sur laquelle
              vous allez adorer passer de longues soirées d’été. ",
  url: kolocs.url
)

event_tags[kolocs.id].each do |tag_name|
  EventTag.create!(
    event: kolocs_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

chat_noir_event = Event.create!(
  price: 0,
  name: "Soirée @ Le Chat Noir",
  category: "Bar Rock",
  venue: chat_noir,
  beginning_hour: '17:00',
  end_hour: '02:00',
  description: "Le Chat Noir, c’est avant tout un café concerts déjà bien connu des nantais. Les dimanches soirs, des concerts, principalement de
            blues. Les lundis, soirée jeux. Le mardi, les concerts « semi-acoustiques » sont très réguliers. Chaque mercredi se déroulent
            deux rendez-vous incontournables: l’initiation à la langue des signes de 18h30 à 19h30, et la scène ouverte musicale. Les vendredi
            et samedi laissent place à des soirées mix, vinyles, avec un style musical allant du funk, groove, vintage au rock, en passant
            par la musique balkanique et festive! Un esprit guinguette qu’on aime cultiver ici!!!",
  url: chat_noir.url
)

event_tags[chat_noir.id].each do |tag_name|
  EventTag.create!(
    event: chat_noir_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

aux_ptits_joueurs_event = Event.create!(
  price: 0,
  name: "Soirée Aux P'tits Joueurs",
  category: "Bar de jeux",
  venue: aux_ptits_joueurs,
  beginning_hour: '18:00',
  end_hour: '02:00',
  description: "Aux p’tits joueurs est un bistrot rétro où l’on peut jouer et assister à des concerts. Le jeu de prédilection des habitants
              de la Cité des Ducs a été sauvegardé: La boule nantaise! À l’époque, l’activité distrayait les travailleurs sur les péniches,
              si vous regardez bien, le terrain a la forme d’une cale de péniche!. Ici, cuisine traditionnelle se mêle aux tournois de
              boules nantaises, à des concerts tous les vendredis soirs, des tournois de poker tous les mercredis et même des expositions.",
  url: aux_ptits_joueurs.url
)

event_tags[aux_ptits_joueurs.id].each do |tag_name|
  EventTag.create!(
    event: aux_ptits_joueurs_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

macadam_event = Event.create!(
  price: 0,
  name: "Soirée au Macadam",
  category: "Dance & Night Club",
  venue: macadam,
  beginning_hour: '22:00',
  end_hour: '05:00',
  description: "Le Macadam c'est un lieu où l'on vient danser et découvrir les musiques électroniques dans toute leur diversité: house music,
              dub, hardcore, danse ou psytrance. Un dimanche par mois, de 7h à 22h, Gloria - All day long permet de venir s'éclater en
              sortant des sentiers battus avec succession de DJ! Amusez-vous, surprenez-nous!, tel est le crédo de Macadam.",
  url: macadam.url
)

event_tags[macadam.id].each do |tag_name|
  EventTag.create!(
    event: macadam_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

bowl_center_event = Event.create!(
  price: 0,
  name: "Soirée au Bowl Center",
  category: "Bowling",
  venue: bowl_center,
  beginning_hour: '12:00',
  end_hour: '03:00',
  description: "Le bowling pour tous. 32 pistes de bowling avec un équipement haut de gamme fluorescent, des écrans vidéo au-dessus de chacune
              des pistes de bowling, des jeux de lumières… Peu de centres de bowling en France vous offrent un tel spectacle!
              En plus du bowling, vous pourrez profiter du bar, d’un espace billards, de jeux d’arcades, des restaurants et des animations
              sonores et visuelles.",
  url: bowl_center.url
)

event_tags[bowl_center.id].each do |tag_name|
  EventTag.create!(
    event: bowl_center_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

eurobowl_event = Event.create!(
  price: 0,
  name: "Soirée @ Eurobowl",
  category: "Bowling",
  venue: eurobowl,
  beginning_hour: '12:00',
  end_hour: '03:00',
  description: "Détendez-vous sur les 26 pistes de bowling équipées de jeux de lumières et d’un show fluo, 14 écrans géants. Salle de billard,
              Pool, Snooker, Américain. Salle Arcade équipée de jeux vidéo. Eurobowl : un espace dédié aux loisirs 7j/7",
  url: eurobowl.url
)

event_tags[eurobowl.id].each do |tag_name|
  EventTag.create!(
    event: eurobowl_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

tadam_escape_event = Event.create!(
  price: 0,
  name: "Soirée au Tadam Escape",
  category: "Escape Game",
  venue: tadam_escape,
  beginning_hour: '12:00',
  end_hour: '23:00',
  description: "Un Escape Game dont toutes les missions s’adaptent sur 4 niveaux différents (Enfant / Débutant / Intermédiaire / Expert),
              pour les petits, pour les familles, entre potes, entre collègues et même pour les pros de l’évasion! Un live Escape Game est
              un jeu d’évasion grandeur nature. Il s’agit d’une activité de loisir. Vous n’avez besoin d’aucune connaissance particulière,
              ni de force physique. C’est un jeu de coopération, de réflexion, d’observation et de logique.",
  url: tadam_escape.url
)

event_tags[tadam_escape.id].each do |tag_name|
  EventTag.create!(
    event: tadam_escape_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

onirium_event = Event.create!(
  price: 0,
  name: "Soirée au Onirium",
  category: "Escape Game",
  venue: onirium,
  beginning_hour: '12:00',
  end_hour: '24:00',
  description: "S’évader d’une pièce dans un temps limité, et ce grâce à l’intellect plutôt que par la force? C’est l’aventure que vous propose
              de vivre l’Onirium. Pour une équipe de 3 à 12 joueurs, il s’agira d’une incursion d’une heure dans un univers original, inédit,
              à mi-chemin entre un Cluedo grandeur nature, Da Vinci Code ou Fort Boyard, entre énigmes et manipulations diverses. Qui, enfant,
              n’a jamais rêvé de se glisser dans la peau d’un espion, sorcier, aventurier ou autre personnages fascinant?",
  url: onirium.url
)

event_tags[onirium.id].each do |tag_name|
  EventTag.create!(
    event: onirium_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

patinoire_petit_port_event = Event.create!(
  price: 0,
  name: "Soirée au Patinoire",
  category: "Patinoire",
  venue: patinoire_petit_port,
  beginning_hour: '12:00',
  end_hour: '23:30',
  description: "Située dans un espace de loisirs (piscine et patinoire), à quelques minutes du centre-ville de Nantes, la patinoire du Petit
              Port vous accueille toute l’année. De multiples loisirs sur glace sont proposés pour petits et grands: animations, séances à
              thème, jardin dʼenfants... De nombreuses occasions pour faire du sport et se détendre entre amis ou en famille.",
  url: patinoire_petit_port.url
)

event_tags[patinoire_petit_port.id].each do |tag_name|
  EventTag.create!(
    event: patinoire_petit_port_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

city_kart_event = Event.create!(
  price: 0,
  name: "Soirée au City Kart",
  category: "Karting",
  venue: city_kart,
  beginning_hour: '12:00',
  end_hour: '20:00',
  description: "Avec City Kart, quelque soit l'activité Sport Automobile que vous souhaitez faire ou offrir: Karting Indoor ou Simulateurs de
              Formule 1 à St-Sébastien ou Karting Outdoor à Sautron, pour les adultes ou pour les enfants dès 7 ans, particuliers et entreprises,
              toute notre équipe de passionnés se fera un plaisir de vous accompagner. Prenez un maximum de plaisir au volant de nos karts
              thermiques et défiez le chronomètre pour un moment d'adrénaline pur! ",
  url: city_kart.url
)

event_tags[city_kart.id].each do |tag_name|
  EventTag.create!(
    event: city_kart_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

lasergame_evolution_event = Event.create!(
  price: 0,
  name: "Soirée au City Kart",
  category: "Lasergame",
  venue: lasergame_evolution,
  beginning_hour: '12:00',
  end_hour: '23:00',
  description: "Le Laser Game Evolution® de Saint-Herblain est heureux de vous accueillir et de vous apporter les meilleures conditions de jeu.
              Venez découvrir la précision du matériel LV2 100% laser, ainsi que nos 4 zone multi-niveaux. Le centre de Saint-Herblain peut
              accueillir jusqu'à 60 joueurs en même temps dans 4 labyrinthes, allant de 50m² à 650m² par salle pour une surface totale de 1500m²
              de labyrinthes.",
  url: lasergame_evolution.url
)

event_tags[lasergame_evolution.id].each do |tag_name|
  EventTag.create!(
    event: lasergame_evolution_event,
    tag: Tag.find_by!(name: tag_name)
  )
end

puts "Generating dynamic venues..."
# /////////////////// Dynamic Venues ////////////////
# every thursday evening
musee_darts_de_nantes = Venue.create!(name: "Musée d'arts de Nantes", kind: "musée", address: "10 Rue Georges Clemenceau, 44000 Nantes", url: "https://museedartsdenantes.nantesmetropole.fr/en/home.html", photo: File.open(Rails.root.join('db/fixtures/venues/musee.jpg')), phone_number: '02 51 83 51 34') # tous les jeudis nocturne gratuite de 19 a 21, musée, culture, posé
event_tags[musee_darts_de_nantes.id] = ["posée", "social", "culture", "exposition"]

event = Event.create!(
  price: 0,
  name: "Les nocturnes du Musée d'arts de Nantes",
  category: "Musée",
  venue: musee_darts_de_nantes,
  beginning_hour: '19h00',
  end_hour: '21h00',
  description: "Tous les jeudis de 19h à 21h, le musée est en entrée libre ! Après le travail ou pour débuter la soirée, profitez de ces deux heures entre amis ou en famille pour découvrir le musée ! ",
  url: "https://museedartsdenantes.nantesmetropole.fr/nocturnes",
  picture: musee_darts_de_nantes.photo
)

event_tags[musee_darts_de_nantes.id].each do |tag_name|
  EventTag.create!(
    event: event,
    tag: Tag.find_by!(name: tag_name)
  )
end

# dynamic events
theatre_de_jeanne = Venue.create!(name: "Théâtre de Jeanne", kind: "théâtre", address: "5 rue des Salorges 44000 Nantes", url: "www.theatre-jeanne.com", photo: File.open(Rails.root.join('db/fixtures/venues/jeanne.jpg')), phone_number: '02 51 83 51 34') #théâtre, culture, posé, seul, en groupe
event_tags[theatre_de_jeanne.id] = ["posée", "regarder", "théâtre"]

katorza = Venue.create!(name: "Katorza", kind: "cinéma", address: "3 Rue Corneille, 44000 Nantes", url: "www.katorza.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/katorza.jpg'))) # cinéma
event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

gaumont = Venue.create!(name: "Gaumont Nantes", kind: "cinéma", address: "12 place du commerce, 44000 Nantes ", url: "https://www.cinemaspathegaumont.com/cinemas/cinema-gaumont-nantes", photo: File.open(Rails.root.join('db/fixtures/venues/gaumont.jpg'))) # cinéma

event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

cinematographe = Venue.create!(name: "Le Cinématographe", kind: "cinéma", address: "12bis Rue des Carmélites, 44000 Nantes", url: "https://www.lecinematographe.com/", photo: File.open(Rails.root.join('db/fixtures/venues/cinema.jpg')), phone_number: '02 51 83 51 34') # cinéma, culture
event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

puts "Fetching Cinema"
# TODO dynamic events with scraping
FetchCinemaEventsService.new.call

puts "Fetching Culture"
FetchCultureRecordsService.new.call

puts "Fetching Concerts"
FetchConcertsService.new.call

puts "Seeds generated!"

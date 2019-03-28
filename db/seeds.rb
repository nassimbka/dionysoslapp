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
  "romance",
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

# puts "Generating conversion words..."

# ////////////// Conversion words ///////////
# ConversionWord.create!(name: "", tag: )

# tranquille => posé
# couple => groupe
# documentaire => culture
# spectacle de danse => culture
# faire un gros travail de word conversion sur culture pour se retrouver avec plus de résultats
# ecrire "posée" dans les tags

puts "Generating venues..."
# /////////////////// Venues ////////////////
event_tags = {}
# generic bar
zygobar = Venue.create!(name: "Le Zygobar", kind: "bar", address: "35 rue des Olivettes, 44000 Nantes", url: "https://www.facebook.com/zygo.bar/", photo: File.open(Rails.root.join('db/fixtures/venues/zygobar.jpg', phone_number: '02 51 83 51 34'))) # jazz, culture, bar à ambiance, theme
event_tags[zygobar.id] = ["posée", "social", "comptoir", "musique", "jazz"]

be2m = Venue.create!(name: "Bé2M", kind: "bar", address: "32 bis rue Fouré, 44 000 Nantes", url: "https://www.lafourchette.com/restaurant/be2m/391641?cc=15284-c78", photo: File.open(Rails.root.join('db/fixtures/venues/be2m.jpg', phone_number: '02 51 83 51 34'))) # bar à vin, tapas, posé, manger un bout
event_tags[be2m.id] = ["posée", "social", "comptoir", "boisson"]

santeuil = Venue.create!(name: "Santeuil Café", kind: "bar", address: "5 rue Santeuil, 44 000 Nantes", url: "https://www.instagram.com/santeuilcafe/?utm_source=ig_embed", photo: File.open(Rails.root.join('db/fixtures/venues/santeuil.jpg', phone_number: '02 51 83 51 34'))) # bar à cocktail, soirée blind test tous les derniers mercredi du mois
event_tags[santeuil.id] = ["posée", "social", "comptoir", "boisson"]

cantine_du_voyage = Venue.create!(name: "La Cantine du Voyage", kind: "bar", address: "Quai des Antilles, 44 000 Nantes", url: "https://www.levoyageanantes.fr/etapes/la-cantine-du-voyage-2/", photo: File.open(Rails.root.join('db/fixtures/venues/cantine_voyage.jpg', phone_number: '02 51 83 51 34'))) # lifestyle, jouer, ouverte uniquement du 04/04/2019 au 13/10/2019
event_tags[cantine_du_voyage.id] = ["posée", "social", "comptoir", "boisson", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

bubar = Venue.create!(name: "Le Bubar", kind: "bar", address: "5 rue Louis Blanc, 44 200 Nantes", url: "https://www.facebook.com/bubarnantes/", photo: File.open(Rails.root.join('db/fixtures/venues/bubar.jpg', phone_number: '02 51 83 51 34'))) # bar à bières,
event_tags[bubar.id] = ["posée", "social", "comptoir", "boisson"]

nid = Venue.create!(name: "Le Nid", kind: "bar", address: "Tour de Bretagne, Place de Bretagne, 44 047 Nantes", url: "https://www.facebook.com/LeNidNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/le_nid.jpg', phone_number: '02 51 83 51 34'))) # rooftop, lounge, concerts
event_tags[nid.id] = ["posée", "social", "comptoir", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

vertigo = Venue.create!(name: "Le Vertigo", kind: "bar", address: "3 mail du Front Populaire, 44 200 Nantes", url: "https://www.facebook.com/VertigoNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/vertigo.jpg', phone_number: '02 51 83 51 34'))) # bar, rooftop, plusieurs ambiances
event_tags[vertigo.id] = ["posée", "social", "comptoir", "dynamique", "solo", "groupe", "musique", "gratuit / prix libre" ]

bateau_lavoir = Venue.create!(name: "Le Bateau Lavoir", kind: "bar", address: "Quai Ceineray, 44 000 Nantes", url: "https://www.facebook.com/bateaulavoirNantes/", photo: File.open(Rails.root.join('db/fixtures/venues/lavoir.jpg', phone_number: '02 51 83 51 34'))) # péniche, guinguette
event_tags[bateau_lavoir.id] = ["posée", "social", "comptoir"]

corneille = Venue.create!(name: "Le Corneille", kind: "bar", address: "24 rue Scribe, 44 000 Nantes", url: "http://www.aperorestodisco.com/bar-nantes-9629-le-corneille.html", photo: File.open(Rails.root.join('db/fixtures/venues/corneille.jpg', phone_number: '02 51 83 51 34'))) # bar classique
event_tags[corneille.id] = ["posée", "social", "comptoir"]

berlin1989 = Venue.create!(name: "Berlin 1989", kind: "bar", address: "95 bd Gabriel Lauriol, 44 300 Nantes", url: "https://berlin1989.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/berlin.jpg', phone_number: '02 51 83 51 34'))) #bar à thème, manger un bout, espace extérieur
event_tags[berlin1989.id] = ["posée", "social", "comptoir"]

flemings = Venue.create!(name: "Fleming’s irish pub", kind: "bar", address: "22 rue des Carmes, 44 000 Nantes", url: "http://www.flemings-irish-pub.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/flemmings.jpg', phone_number: '02 51 83 51 34'))) #Irish pub, whisky, sportsbar
event_tags[flemings.id] = ["posée", "social", "comptoir", "boisson"]

labo = Venue.create!(name: "Le Labo", kind: "bar", address: "19 rue Léon Blum, 44 000 Nantes", url: "http://www.lelabo-nantes.com/", photo: File.open(Rails.root.join('db/fixtures/venues/labo.jpg', phone_number: '02 51 83 51 34'))) # bar à cocktails
event_tags[labo.id] = ["posée", "social", "comptoir", "boisson"]

lieu_unique = Venue.create!(name: "Le Lieu Unique", kind: "bar", address: "2 rue de la biscuiterie, 44 000 Nantes", url: "", photo: File.open(Rails.root.join('db/fixtures/venues/lieu.jpg', phone_number: '02 51 83 51 34'))) #bar ambiance, culture, manger un bout
event_tags[lieu_unique.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre", "social", "culture"]

kolocs = Venue.create!(name: "Les Koloc's", kind: "bar", address: "59 Quai de la Fosse, 44000 Nantes", url: "https://www.facebook.com/kolocs/", photo: File.open(Rails.root.join('db/fixtures/venues/kolocs.jpg', phone_number: '02 51 83 51 34'))) #bar ambiance, faire la fête
event_tags[kolocs.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre"]

aux_ptits_joueurs = Venue.create!(name: "Aux Ptits Joueurs", kind: "bar", address: "23 Rue du Port Guichard 44000 Nantes", url: "https://www.facebook.com/ptitsjoueurs/", photo: File.open(Rails.root.join('db/fixtures/venues/petits.jpg', phone_number: '02 51 83 51 34'))) # typique/traditionnel, boule nantaise, boire, manger un bout, concert, jeux
event_tags[aux_ptits_joueurs.id] = ["dynamique", "solo", "groupe", "musique", "gratuit / prix libre", "activité", "tranquille", "posée", "social", "comptoir", "musique"]

# generic nightclub
macadam = Venue.create!(name: "Macadam", kind: "nightclub", address: "17 rue Jules Launay - Nantes", url: "https://www.facebook.com/macadam.nantes/", photo: File.open(Rails.root.join('db/fixtures/venues/macadam.jpg', phone_number: '02 51 83 51 34'))) # danser, se défouler, club, électro
event_tags[macadam.id] = ["dynamique", "solo", "groupe", "musique", "payant", "electro"]

# generic activity
bowl_center = Venue.create!(name: "BowlCenter", kind: "bowling", address: "151 Rue du Moulin de la Rousselière, 44800 Saint-Herblain", url: "https://nantes.bowlcenter.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/bowl.jpg', phone_number: '02 51 83 51 34'))) # activité, groupe, posé
event_tags[bowl_center.id] = ["dynamique", "groupe", "activité", "tranquille"]

eurobowl = Venue.create!(name: "Eurobowl Saint Sébastien sur Loire", kind: "bowling", address: "27 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "www.eurobowl.fr/saint-sebastien/", photo: File.open(Rails.root.join('db/fixtures/venues/eurobowl.jpg', phone_number: '02 51 83 51 34'))) #manger un bout, jeux, en groupe
event_tags[eurobowl.id] = ["dynamique", "groupe", "activité", "tranquille"]

tadam_escape = Venue.create!(name: "TADAM Escape", kind: "escape game", address: " 14 Rue de l'Hôtellerie, Carquefou, France ", url: "http://tadamescape.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/tadam.jpg', phone_number: '02 51 83 51 34'))) #activité, sensations, aventure, groupe
event_tags[tadam_escape.id] = ["dynamique", "groupe", "activité", "tranquille"]

onirium = Venue.create!(name: "Onirium", kind: "escape game", address: " 34 Bis Boulevard Gabriel Guist’hau 44000 Nantes", url: "https://lonirium.com/", photo: File.open(Rails.root.join('db/fixtures/venues/onirium.jpg', phone_number: '02 51 83 51 34'))) #aventure, activité, groupe
event_tags[onirium.id] = ["dynamique", "groupe", "activité", "tranquille"]

patinoire_petit_port = Venue.create!(name: "La patinoire du Petit Port", kind: "patinoire", address: "Boulevard du Petit Port, 44300 Nantes", url: "https://www.patinoire-nantes.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/patinoire.jpg', phone_number: '02 51 83 51 34'))) # activité, groupe, dynamique, sportif, glisse
event_tags[patinoire_petit_port.id] = ["dynamique", "groupe", "activité", "sportif"]

city_kart = Venue.create!(name: "City Kart", kind: "karting", address: "33 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "https://www.city-kart.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/kart.jpg', phone_number: '02 51 83 51 34'))) # activité, groupe, dynamique
event_tags[city_kart.id] = ["dynamique", "groupe", "activité", "sportif"]

lasergame_evolution = Venue.create!(name: "Lasergame Evolution", kind: "lasergame", address: "3 Rue des Piliers de la Chauvinière, 44800 Saint-Herblain", url: "https://www.lasergame-evolution.com/fr/102/Nantes%20St-Herblain/", photo: File.open(Rails.root.join('db/fixtures/venues/laser.jpg', phone_number: '02 51 83 51 34'))) # activité, groupe, dynamique, intense
event_tags[lasergame_evolution.id] = ["dynamique", "groupe", "activité", "sportif"]


puts "Generating generic events..."
# /////////////////// Generic Events ////////////////
Venue.all.each do |venue|
  event = Event.create!(
    price: 0,
    name: "Soirée @ #{venue.name}",
    category: venue.kind,
    venue: venue,
    beginning_hour: '19h00',
    end_hour: '02h15',
    description: "Soirée trop cool @ #{venue.name}",
    url: venue.url
  )

  event_tags[venue.id].each do |tag_name|
    EventTag.create!(
      event: event,
      tag: Tag.find_by!(name: tag_name)
    )
  end
end

puts "Generating dynamic venues..."
# /////////////////// Dynamic Venues ////////////////
# every thursday evening
musee_darts_de_nantes = Venue.create!(name: "Musée d'arts de Nantes", kind: "musée", address: "10 Rue Georges Clemenceau, 44000 Nantes", url: "https://museedartsdenantes.nantesmetropole.fr/en/home.html", photo: File.open(Rails.root.join('db/fixtures/venues/musee.jpg', phone_number: '02 51 83 51 34'))) # tous les jeudis nocturne gratuite de 19 a 21, musée, culture, posé
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
theatre_de_jeanne = Venue.create!(name: "Théâtre de Jeanne", kind: "théâtre", address: "5 rue des Salorges 44000 Nantes", url: "www.theatre-jeanne.com", photo: File.open(Rails.root.join('db/fixtures/venues/jeanne.jpg', phone_number: '02 51 83 51 34'))) #théâtre, culture, posé, seul, en groupe
event_tags[theatre_de_jeanne.id] = ["posée", "regarder", "théâtre"]

katorza = Venue.create!(name: "Le Katorza", kind: "cinéma", address: "3 Rue Corneille, 44000 Nantes", url: "www.katorza.fr/", photo: File.open(Rails.root.join('db/fixtures/venues/katorza.jpg', phone_number: '02 51 83 51 34'))) # cinéma
event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

gaumont = Venue.create!(name: "Cinéma Gaumont Nantes", kind: "cinéma", address: "12 place du commerce, 44000 Nantes ", url: "https://www.cinemaspathegaumont.com/cinemas/cinema-gaumont-nantes", photo: File.open(Rails.root.join('db/fixtures/venues/gaumont.jpg', phone_number: '02 51 83 51 34'))) # cinéma
event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

cinematographe = Venue.create!(name: "Le Cinématographe", kind: "cinéma", address: "12bis Rue des Carmélites, 44000 Nantes", url: "https://www.lecinematographe.com/", photo: File.open(Rails.root.join('db/fixtures/venues/cinema.jpg', phone_number: '02 51 83 51 34'))) # cinéma, culture
event_tags[katorza.id] = ["posée", "regarder", "cinéma"]

puts "Generating dynamic events..."
# TODO dynamic events with scraping

puts "Seeds generated!"

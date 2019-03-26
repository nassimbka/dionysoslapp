# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database..."

User.destroy_all
Venue.destroy_all
Tag.destroy_all

puts "Database cleaned!"
puts "------------------"
puts "Generating seeds..."

puts "Generating events..."



puts "Generating venues..."
# /////////////////// Venues ////////////////
zygobar = Venue.create(name: "Le Zygobar", kind: "bar", address: "35 rue des Olivettes, 44000 Nantes", url: "https://www.facebook.com/zygo.bar/") # jazz, culture, bar à ambiance, theme
be2m = Venue.create(name: "Bé2M", kind: "bar", address: "32 bis rue Fouré, 44 000 Nantes", url: "https://www.lafourchette.com/restaurant/be2m/391641?cc=15284-c78") # bar à vin, tapas, posé, manger un bout
santeuil = Venue.create(name: "Santeuil Café", kind: "bar", address: "5 rue Santeuil, 44 000 Nantes", url: "https://www.instagram.com/santeuilcafe/?utm_source=ig_embed") # bar à cocktail, soirée blind test tous les derniers mercredi du mois
cantine_du_voyage = Venue.create(name: "La Cantine du Voyage", kind: "bar", address: "Quai des Antilles, 44 000 Nantes", url: "https://www.levoyageanantes.fr/etapes/la-cantine-du-voyage-2/") # lifestyle, jouer, ouverte uniquement du 04/04/2019 au 13/10/2019
bubar = Venue.create(name: "Le Bubar", kind: "bar", address: "5 rue Louis Blanc, 44 200 Nantes", url: "https://www.facebook.com/bubarnantes/") # bar à bières,
nid = Venue.create(name: "Le Nid", kind: "bar", address: "Tour de Bretagne, Place de Bretagne, 44 047 Nantes", url: "https://www.facebook.com/LeNidNantes/") # rooftop, lounge, concerts
vertigo = Venue.create(name: "Le Vertigo", kind: "bar", address: "3 mail du Front Populaire, 44 200 Nantes", url: "https://www.facebook.com/VertigoNantes/") # bar, rooftop, plusieurs ambiances
bateau_lavoir = Venue.create(name: "Le Bateau Lavoir", kind: "bar", address: "Quai Ceineray, 44 000 Nantes", url: "https://www.facebook.com/bateaulavoirNantes/") # péniche, guinguette
corneille = Venue.create(name: "Le Corneille", kind: "bar", address: "24 rue Scribe, 44 000 Nantes", url: "") # bar classique
berlin1989 = Venue.create(name: "Berlin 1989", kind: "bar", address: "95 bd Gabriel Lauriol, 44 300 Nantes", url: "") #bar à thème, manger un bout, espace extérieur
flemings = Venue.create(name: "Fleming’s irish pub", kind: "bar", address: "22 rue des Carmes, 44 000 Nantes", url: "") #Irish pub, whisky, sportsbar
labo = Venue.create(name: "Le Labo", kind: "bar", address: "19 rue Léon Blum, 44 000 Nantes", url: "") # bar à cocktails
lieu_unique = Venue.create(name: "Le Lieu Unique", kind: "bar", address: "2 rue de la biscuiterie, 44 000 Nantes", url: "") #bar ambiance, culture, manger un bout
kolocs = Venue.create(name: "Les Koloc's", kind: "bar", address: "59 Quai de la Fosse, 44000 Nantes", url: "") #bar ambiance, faire la fête
katorza = Venue.create(name: "Le Katorza", kind: "cinema", address: "3 Rue Corneille, 44000 Nantes", url: "www.katorza.fr/") # cinéma
cinematographe = Venue.create(name: "Le Cinématographe", kind: "cinema", address: "12bis Rue des Carmélites, 44000 Nantes", url: "https://www.lecinematographe.com/") # cinéma, culture
bowl_center = Venue.create(name: "BowlCenter", kind: "bowling", address: "151 Rue du Moulin de la Rousselière, 44800 Saint-Herblain", url: "https://nantes.bowlcenter.fr/") # activité, groupe, posé
aux_ptits_joueurs = Venue.create(name: "Aux Ptits Joueurs", kind: "bar", address: "23 Rue du Port Guichard 44000 Nantes", url: "https://www.facebook.com/ptitsjoueurs/") # activité, groupe, dynamique, posé, typique/traditionnel, boule nantaise, boire, manger un bout, concert, jeux
eurobowl = Venue.create(name: "Eurobowl Saint Sébastien sur Loire", kind: "bowling", address: "27 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "www.eurobowl.fr/saint-sebastien/") #manger un bout, jeux, en groupe
tadam_escape = Venue.create(name: "TADAM Escape", kind: "escape game", address: " 14 Rue de l'Hôtellerie, Carquefou, France ", url: "http://tadamescape.fr/") #activité, sensations, aventure, groupe
onirium = Venue.create(name: "Onirium", kind: "escape game", address: " 34 Bis Boulevard Gabriel Guist’hau 44000 Nantes", url: "https://lonirium.com/") #aventure, activité, groupe
patinoire_petit_port = Venue.create(name: "La patinoire du Petit Port", kind: "patinoire", address: "Boulevard du Petit Port, 44300 Nantes", url: "https://www.patinoire-nantes.fr/") # activité, groupe, dynamique, sportif, glisse
city_kart = Venue.create(name: "City Kart", kind: "karting", address: "33 Rue Marie Curie, 44230 Saint-Sébastien-sur-Loire", url: "https://www.city-kart.fr/") # activité, groupe, dynamique
lasergame_evolution = Venue.create(name: "Lasergame Evolution", kind: "lasergame", address: "3 Rue des Piliers de la Chauvinière, 44800 Saint-Herblain", url: "https://www.lasergame-evolution.com/fr/102/Nantes%20St-Herblain/") # activité, groupe, dynamique, intense
theatre_de_jeanne = Venue.create(name: "Théâtre de Jeanne", kind: "théâtre", address: "5 rue des Salorges 44000 Nantes", url: "www.theatre-jeanne.com") #théâtre, culture, posé, seul, en groupe
musee_darts_de_nantes = Venue.create(name: "Musée d'arts de Nantes", kind: "musée", address: "10 Rue Georges Clemenceau, 44000 Nantes", url: "") # tous les jeudis nocturne gratuite de 19 a 21, musée, culture, posé
macadam = Venue.create(name: "Macadam", kind: "nightclub", address: "17 rue Jules Launay - Nantes", url: "https://www.facebook.com/macadam.nantes/") # danser, se défouler, club, électro
venue_1 = Venue.create(name: "", kind: "", address: "", url: "")

# /////////////////// Events ////////////////
Venue.all.each do |venue|
  Event.create(price: 0, name: "soirée au #{venue.name}", category: "soirée bar", venue: venue, beginning_hour: '2019-01-01 19:30:00', end_hour: '2019-01-01 02:00:00', description: "soirée trop cool @ #{venue.name}", url: venue.url)
end

puts "Generating conversion words..."

# ////////////// Conversion words ///////////
ConversionWord.create(name: "", tag: )

# tranquille => posé
# couple => groupe
# documentaire => culture
# spectacle de danse => culture
# faire un gros travail de word conversion sur culture pour se retrouver avec plus de résultats


puts "Generating tags..."

# //////////////////// Tags /////////////////
Tag.create(name: "comptoir")
Tag.create(name: "boisson")
Tag.create(name: "culture")
Tag.create(name: "activité")
Tag.create(name: "musique")
Tag.create(name: "payant")
Tag.create(name: "activité sportive")
Tag.create(name: "posé")
Tag.create(name: "électro")
Tag.create(name: "rock")
Tag.create(name: "hip-Hop")
Tag.create(name: "latino")
Tag.create(name: "jazz")
Tag.create(name: "musiques du monde")
Tag.create(name: "gratuit / prix libre")
Tag.create(name: "dynamique")
Tag.create(name: "solo")
Tag.create(name: "groupe")
Tag.create(name: "social")
Tag.create(name: "à regarder")
Tag.create(name: "boisson")
Tag.create(name: "musique")
#
# solo
# groupe
# social
# à regarder pour cinéma et théâtre
# boisson
# musique

# ///////

#


puts "Seeds generated!"

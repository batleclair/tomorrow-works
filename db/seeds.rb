# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require 'open-uri'
require 'faker'
require 'date'

10.times do
    User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "azertyuiop"
  )
end

nonprofits = %w[W751030744 W551000280 W502000271 W941004039 W751053021 W372013179 W143002051 W012008615 W832010273 W9M1001840 W251000323]

filepath = File.join(File.dirname(__FILE__), "items_jobs.json")
serialized_offers = File.read(filepath)

offers = JSON.parse(serialized_offers)

offers.each do |offer|
  url = "https://entreprise.data.gouv.fr/api/rna/v1/id/#{nonprofits.sample}"
  data = JSON.parse(URI.open(url).read)["association"]
  if Nonprofit.find_by(name: data["titre_court"].capitalize)
    nonprofit = Nonprofit.find_by(name: data["titre_court"].capitalize)
  else
    nonprofit = Nonprofit.new
    nonprofit.name = data["titre_court"].capitalize
    nonprofit.address = "#{data['adresse_numero_voie']} #{data['adresse_type_voie']} #{data['adresse_libelle_voie']} #{data['adresse_libelle_commune']}, #{data['adresse_code_postal']} France"
    nonprofit.city = data['adresse_libelle_commune']
    nonprofit.description = data["objet"]
    nonprofit.user = User.all.sample
    nonprofit.siret = data["id_association"]
    nonprofit.mission = Nonprofit::MISSIONS.sample
    nonprofit.save
  end
  @offer = Offer.new
  @offer.user = User.all.sample
  @offer.start_date = Date.new(2022, 9, 3)
  @offer.description = offer["description"]
  @offer.title = offer["headline"]
  @offer.info = offer["articleBodyHtml"]
  @offer.salary = (1500..2500).to_a.sample
  @offer.duration = (1..24).to_a.sample
  @offer.salary = (1500..2500).to_a.sample
  @offer.frequency = (2..5).to_a.sample
  @offer.nonprofit_id = nonprofit.id
  @offer.location = %w[Paris Lyon Marseille Lille Nice Nantes Toulouse Bordeaux Montpellier].sample
  @offer.save!
  sleep(0.4)
end

user = User.new
user.first_name = "Gérard"
user.last_name = "Dubois"
user.email = "mouna.dubois@gmail.com"
user.password = "654321"
user.status = "Association"
user.save!


nonprofit = Nonprofit.new
nonprofit.name = "Bureaux du Coeur"
nonprofit.address = "16 boulevard Charles de Gaulle, 44800 Saint-Herblain"
nonprofit.city = "Saint-Herblain"
nonprofit.description = "Développer l’usage des locaux professionnels en accueil individuel d’urgence, le soir et le week-end, lorsqu’ils sont vides."
nonprofit.user = User.find_by(email: "mouna.dubois@gmail.com")
nonprofit.siret = "W442024754"
nonprofit.mission = "Réduction des inégalités"
nonprofit.photo
nonprofit.logo
nonprofit.save!

offer = Offer.new
offer.user = User.find_by(email: "mouna.dubois@gmail.com")
offer.start_date = "30/09/2022"
offer.description = "Pour répondre à notre croissance et aux nouveaux projets qui rentrent, l'équipe souhaite s'agrandir et offre une possibilité immédiate.\n

Vous aurez à prendre en charge les missions suivantes :\n

- Conseil et accompagnement sur la performance ;\n
- La participation aux orientations et aux décisions stratégiques;\n
- L'animation de formations, la veille sur la fiscalité et le développement des outils ;\n

Equipe dynamique, désireuse de pouvoir accompagner ses collaborateurs dans leur épanouissement professionnel.\n

Le poste pourra comprendre du télétravail.\n

Profil recherché\n
Titulaire du Diplôme d'Expertise Comptable, vous appuyez une expérience en cabinet de minimum 3 ans, avec une dominance sur l'expertise comptable.\n
Doté du sens des responsabilités, esprit d'équipe, sens commercial, vous possédez un excellent relationnel."
offer.title = "Expert-Comptable F/H"
offer.duration = 18
offer.salary = 2000
offer.frequency = 4
offer.nonprofit  = Nonprofit.find_by(name: "Bureaux du Coeur")
offer.location = "Paris"
offer.save!


offer = Offer.new
offer.user = User.find_by(email: "mouna.dubois@gmail.com")
offer.start_date = "15/06/2022"
offer.description = "Nous recherchons des bénévoles pour développer l’initiative des Bureaux du Cœur à Paris ! L’association étant implantée depuis quelques mois seulement, tout est à construire. En tant que référent, vous serez l’interlocuteur dédié des associations, entreprises hôtes et invité.e.s. Vous serez donc au cœur de l’activité et vivrez une incroyable aventure humaine !
Les missions sont les suivantes :
Promouvoir les Bureaux du Cœur à Lille
Prospecter et accompagner des entreprises pour qu'elles deviennent hôtes (via votre réseau personnel, LinkedIn, des Clubs d'Entreprise, forum, presse, etc.)
Nouer des partenariats avec des associations
Suivre l'accueil de vos invité.e.s en assurant les bilans d’étape mensuels
Veiller au respect permanent de la charte de valeurs
Participer, en étant force de proposition, aux réunions organisées par la déléguée régionale
Si vous aimez réaliser des actions concrètes à fort impact et appréciez les contacts humains, rejoignez-nous !"
offer.title = "Développer l'accueil de personnes en grande précarité au sein de bureaux"
offer.salary = 1600
offer.duration = 6
offer.frequency = 2
offer.nonprofit  = Nonprofit.find_by(name: "Bureaux du Coeur")
offer.location = "Lille"
offer.save!


jean = User.create!(
  first_name: "Jean-Eudes",
  last_name: "Nallatamby",
  email: "Jean-Eudes.Nallatamby@gmail.com",
  status: "Candidat",
  password: "654321"
)

keyvan = User.create!(
  first_name: "Keyvan",
  last_name: "Sabras",
  email: "Keyvan.Sabras@gmail.com",
  status: "Candidat",
  password: "654321"
)

baptiste = User.create!(
  first_name: "Baptiste",
  last_name: "Clair",
  email: "Baptiste.clair@gmail.com",
  status: "Candidat",
  password: "654321"
)

dagmara = User.create!(
  first_name: "Dagmara",
  last_name: "Korta",
  email: "Dagmara.korta@gmail.com",
  status: "Candidat",
  password: "654321"
)

company = Company.new
company.user = jean
company.name = "Leroy Merlin"
company.sector = "Matériaux Innovants, Produits pour la Construction, Distribution Bâtiment"
company.save!

company = Company.new
company.user = dagmara
company.name = "Easy Jet"
company.sector = "Aviation"
company.save!

company = Company.new
company.user = keyvan
company.name = "Twitter"
company.sector = "Internet et réseaux sociaux"
company.save!

company = Company.new
company.user = baptiste
company.name = "Clipperton"
company.sector = "Services d’investissement"
company.save!

candidate = Candidate.new
candidate.user = jean
candidate.company = Company.find_by(name: "Leroy Merlin")
candidate.birthdate = "16/03/1998"
candidate.availability = 2
candidate.expertise = "Comptabilité"
candidate.location = "Paris"
candidate.linkedin_url = "https://www.linkedin.com/in/jean-eudes-nallatamby/"
file = URI.open("https://res.cloudinary.com/wagonmoonmoon/image/upload/v1654695231/xjxsujomdvzgzo8oy08g.jpg")
candidate.photo.attach(io: file, filename: "jeaneudes.jpg", content_type: "image/jpg")
candidate.save!

candidate = Candidate.new
candidate.user = dagmara
candidate.company = Company.find_by(name: "Easy Jet")
candidate.birthdate = "17/02/1990"
candidate.availability = 3
candidate.expertise = "Hotesse de l'air"
candidate.location = "Lyon"
candidate.linkedin_url = "https://fr.linkedin.com/in/dagmara-korta-351592b1"
file = URI.open("https://res.cloudinary.com/wagonmoonmoon/image/upload/v1654695300/krbby2xuueqpnzamtydl.jpg")
candidate.photo.attach(io: file, filename: "dagmara.jpg", content_type: "image/jpg")
candidate.save!

candidate = Candidate.new
candidate.user = baptiste
candidate.company = Company.find_by(name: "Clipperton")
candidate.birthdate = "08/08/1986"
candidate.availability = 4
candidate.expertise = "Finance"
candidate.location = "Grenoble"
candidate.linkedin_url = "https://www.linkedin.com/in/baptisteclair"
file = URI.open("https://res.cloudinary.com/wagonmoonmoon/image/upload/v1654695256/kenhqurt8dcb0rum2tda.jpg")
candidate.photo.attach(io: file, filename: "baptiste.jpg", content_type: "image/jpg")
candidate.save!

candidate = Candidate.new
candidate.user = keyvan
candidate.company  = Company.find_by(name: "Twitter")
candidate.birthdate = "26/11/1993"
candidate.availability = 5
candidate.expertise = "Web Development"
candidate.location = "Paris"
candidate.linkedin_url = "https://www.linkedin.com/in/keyvan-sabras"
file = URI.open("https://res.cloudinary.com/wagonmoonmoon/image/upload/v1654695286/ishll4nfeigi4mw8wns1.jpg")
candidate.photo.attach(io: file, filename: "keyvan.jpg", content_type: "image/jpg")
candidate.save!

cv = Cv.new
cv.titre = "Collaborateur comptable et sociale"
cv.entreprise = "AGOREX EXPERTISE"
cv.description = "Gestion d'un portefeuille client, composé de TPE/PME de divers secteurs d'activités :

Comptabilité :
- Tenue de la comptabilité dans son intégralité
- Établissement des déclarations fiscales
- Révisions des comptes
- Calcul et saisie de toutes les écritures d’inventaire comptables (CCA, FNP, FAE…)
- Établissement des bilans et liasses fiscales

Social :
- Elaboration des bulletins de salaire, DSN
- Formalités d'embauche (contrat de travail, déclaration réglementaire...)
- Traitement des absences, attestation de salaire sur net-entreprises

Logiciel : Silae, Cegid"
cv.date_début = "15/08/2020"
cv.date_fin = "15/09/2021"
cv.candidate  = Candidate.find_by(birthdate: "16/03/1998")
cv.save!

cv = Cv.new
cv.titre = "International Flight Attendant"
cv.entreprise = "Ryanair"
cv.description = "Managing multiple responsibilities during the flight working alongside a team, regularly communicating and ensuring an effective time management in order to deliver an excellent customer service"
cv.date_début = "01/05/2018"
cv.date_fin = "01/07/2020"
cv.candidate  = Candidate.find_by(birthdate: "17/02/1990")
cv.save!

cv = Cv.new
cv.titre = "Freelance Web Developer"
cv.entreprise = "Ferrara, Emilia-Romagna, Italy"
cv.description = "• Utilisation de Linux (Ubuntu)
• HTML/CSS SASS
• Intégrer une maquette en respectant une charte graphique
• Les bases du langage PHP,JAVASCRIPT , et l'utilisation de requêtes SQL avec MYSQL
• Utilisation de frameworks & librairies tel que Bootstrap et Jquery
• La création d'un site internet sous le CMS Wordpress ,et la customisation d'un thème Wordpress
• Travailler en équipe et en méthode agile
• Déploiement d’environnement de développement vers le serveur de production
• Utilisation de GIT & Github
• Utilisation de Trello pour la gestion de projets et la définition des tâches pour le travail en équipe
• Réaliser un cahier des charges
• Utilisation du langage Python avec le framework Flask"
cv.date_début = "01/12/2017"
cv.date_fin = "01/11/2021"
cv.candidate  = Candidate.find_by(birthdate: "26/11/1993")
cv.save!

cv = Cv.new
cv.titre = "Data Analyst"
cv.entreprise = "Clipperton"
cv.description = "Au cours de mon alternance j'ai pu travailler sur plusieurs sujets :

Connaissance client :
- Réalisations de dashboards permettant le suivis de segmentations clients
- Enrichissements de données (2nd & 3td party) dans le cadre de campagnes marketings
- Segmentation & clustering : appétence des clients à la promotion
- Scores : déménagement, détection des clients professionnels

Supply Chain :
- Élaboration d'un outil d'optimisation de la fréquence de commande des entrepôts vers les fournisseurs, puis restitution sous forme de dashboard Power BI


Environnements techniques :
- Google Cloud Platform (SQL BigQuery, VM...)
- Python, R
- Git
- Power BI, Data Studio"
cv.date_début = "01/06/2018"
cv.date_fin = "01/06/2021"
cv.candidate  = Candidate.find_by(birthdate: "08/08/1986")
cv.save!

candidature = Candidature.new
candidature.user  = keyvan
candidature.offer  = Offer.find_by(title: "Développer l'accueil de personnes en grande précarité au sein de bureaux")
candidature.candidate  = Candidate.find_by(birthdate: "26/11/1993")
candidature.motivation = "Bonjour, j'espère que vous allez bien. Je suis extrêmement interessé par votre poste qui correspond parfaitement à mes attentes et pour lequel je pense être le candidat idéal. N'hésitez pas à me contacter afin que nous puissions échanger sur le sujet. Bien cordialement, Keyvan"
candidature.save!

candidature = Candidature.new
candidature.user  = jean
candidature.offer  = Offer.find_by(title: "Expert-Comptable F/H")
candidature.candidate  = Candidate.find_by(birthdate: "16/03/1998")
candidature.motivation = "Bonjour, j'espère que vous allez bien. Je suis extrêmement interessé par votre poste qui correspond parfaitement à mes attentes et pour lequel je pense être le candidat idéal. N'hésitez pas à me contacter afin que nous puissions échanger sur le sujet. Bien cordialement, Jean Eudes"
candidature.save!

candidature = Candidature.new
candidature.user  = baptiste
candidature.offer  = Offer.find_by(title: "Développer l'accueil de personnes en grande précarité au sein de bureaux")
candidature.candidate  = Candidate.find_by(birthdate: "08/08/1986")
candidature.motivation = "Bonjour, j'espère que vous allez bien. Je suis extrêmement interessé par votre poste qui correspond parfaitement à mes attentes et pour lequel je pense être le candidat idéal. N'hésitez pas à me contacter afin que nous puissions échanger sur le sujet. Bien cordialement, Baptiste"
candidature.save!

candidature = Candidature.new
candidature.user  = dagmara
candidature.offer  = Offer.find_by(title: "Expert-Comptable F/H")
candidature.candidate  = Candidate.find_by(birthdate: "17/02/1990")
candidature.motivation = "Bonjour, j'espère que vous allez bien. Je suis extrêmement interessée par votre poste qui correspond parfaitement à mes attentes et pour lequel je pense être la candidate idéale. N'hésitez pas à me contacter afin que nous puissions échanger sur le sujet. Bien cordialement, Dagmara"
candidature.save!

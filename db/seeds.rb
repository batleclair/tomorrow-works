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

# 10.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "azertyuiop"
#   )
# end

filepath = File.join(File.dirname(__FILE__), "items_jobs.json")
serialized_offers = File.read(filepath)

offers = JSON.parse(serialized_offers)

offers.each do |offer|
  url = "https://entreprise.data.gouv.fr/api/rna/v1/full_text/#{offer['breadcrumbs'][1]['name'].gsub(/\s+/, '-')}"
  p url
  data = JSON.parse(URI.open(url).read)["association"]
  data = data[-0]
  if Nonprofit.find_by(name: data["titre_court"].capitalize)
    nonprofit = Nonprofit.find_by(name: data["titre_court"].capitalize)
  else
    nonprofit = Nonprofit.new
    nonprofit.name = data["titre_court"].capitalize
    nonprofit.address = "#{data['adresse_numero_voie']}, #{data['adresse_type_voie']} #{data['adresse_libelle_voie']}, #{data['adresse_code_postal']} #{data['adresse_libelle_commune']}"
    nonprofit.description = data["objet"]
    nonprofit.user = User.all.sample
    nonprofit.siret = data["id_nonprofit"]
    nonprofit.save
  end
  @offer = Offer.new
  @offer.description = offer["description"]
  @offer.title = offer["headline"]
  @offer.salary = (1500..2500).to_a.sample
  @offer.duration = (2..5).to_a.sample
  @offer.salary = (1500..2500).to_a.sample
  @offer.nonprofit_id = nonprofit.id
  @offer.location = %w[Paris Lyon Marseille Lille Nice Nantes Toulouse Bordeaux Montpellier].sample
  @offer.save
end

require 'open-uri'
require 'json'

class NonprofitsController < ApplicationController
  def index
    @nonprofits = Nonprofit.all
    @nonprofits = policy_scope(Nonprofit)
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def create
    url = "https://entreprise.data.gouv.fr/api/rna/v1/id/#{nonprofit_params[:siret]}"
    data = JSON.parse(URI.open(url).read)["nonprofit"]
    @nonprofit = Nonprofit.new
    @nonprofit.name = data["titre_court"].capitalize
    @nonprofit.address = "#{data['adresse_numero_voie']}, #{data['adresse_type_voie']} #{data['adresse_libelle_voie']}, #{data['adresse_code_postal']} #{data['adresse_libelle_commune']}"
    @nonprofit.description = data["objet"]
    @nonprofit.user = current_user
    @nonprofit.siret = nonprofit_params[:siret]
    if @nonprofit.save
      redirect_to nonprofits_path
    else
      render :new, unprocessable: :entity
    end
  end

  def edit

  end

  def update

  end

  private

  def nonprofit_params
    params.require(:nonprofit).permit(:siret)
  end
end

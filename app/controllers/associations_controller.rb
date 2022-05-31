require 'open-uri'
require 'json'

class AssociationsController < ApplicationController
  def index
    @associations = Association.all
    authorize @association
  end

  def show
    @association = Association.find(params[:id])
    authorize @association
  end

  def new
    @association = Association.new
    authorize @association
  end

  def create
    url = "https://entreprise.data.gouv.fr/api/rna/v1/id/#{association_params[:siret]}"
    data = JSON.parse(URI.open(url).read)["association"]
    @association = Association.new
    @association.name = data["titre_court"].capitalize
    @association.address = "#{data['adresse_numero_voie']}, #{data['adresse_type_voie']} #{data['adresse_libelle_voie']}, #{data['adresse_code_postal']} #{data['adresse_libelle_commune']}"
    @association.description = data["objet"]
    @association.user = current_user
    @association.siret = association_params[:siret]
    if @association.save
      redirect_to associations_path
    else
      render :new, unprocessable: :entity
    end
  end

  def edit

  end

  def update

  end

  private

  def association_params
    params.require(:association).permit(:siret)
  end
end

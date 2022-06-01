require 'open-uri'
require 'json'

class AssociationsController < ApplicationController
  def index
    @associations = policy_scope(Association)
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
    # url = "https://entreprise.data.gouv.fr/api/rna/v1/id/#{association_params[:siret]}"
    # data = JSON.parse(URI.open(url).read)["association"]
    @association = Association.new(association_params)
    authorize @association
    @association.name = @association.name.capitalize
    @association.user = current_user
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
    params.require(:association).permit(:siret, :mission, :address, :city, :sector, :description, :name)
  end
end

require 'open-uri'
require 'json'

class NonprofitsController < ApplicationController
  def index
    @nonprofits = Nonprofit.all
    @nonprofits = policy_scope(Nonprofit)
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    authorize @nonprofit
  end

  def new
    @nonprofit = Nonprofit.new
    authorize @nonprofit
  end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params)
    authorize @nonprofit
    @nonprofit.name = @nonprofit.name.capitalize
    @nonprofit.user = current_user
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
    params.require(:nonprofit).permit(:siret, :name, :city, :address, :mission, :sector, :description)
  end
end

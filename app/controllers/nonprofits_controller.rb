require 'open-uri'
require 'json'

class NonprofitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    if @nonprofit.save!
      redirect_to dashboard_path
    else
      render :new, unprocessable: :entity
    end
  end

  def edit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def update
    @nonprofit = Nonprofit.find(params[:id])
    @nonprofit.update(nonprofit_params)
    authorize @nonprofit
    redirect_to nonprofit_path(@nonprofit)
  end

  private

  def nonprofit_params
    params.require(:nonprofit).permit(:siret, :name, :city, :address, :mission, :sector, :description, :logo, :photo)
  end
end

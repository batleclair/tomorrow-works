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
    @markers =
      [{
        lat: @nonprofit.latitude,
        lng: @nonprofit.longitude,
        info_window: render_to_string(partial: "info_window", locals: {nonprofit: @nonprofit}),
        image_url: helpers.asset_url("default-np-logo.png")
      }]
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
    if Nonprofit.find_by(name: @nonprofit.name)
      nonprofit = Nonprofit.find_by(name: @nonprofit.name)
      flash[:alert] = "Désolé le compte de #{nonprofit.name} a déjà été créé par #{nonprofit.user.first_name} #{nonprofit.user.last_name}"
      redirect_to new_nonprofit_path
    elsif @nonprofit.save!
      redirect_to dashboard_path
    else
      render "nonprofits/new", status: :unprocessable_entity
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
    params.require(:nonprofit).permit(:siret, :name, :city, :address, :mission, :sector, :description, :content, :logo, :photo)
  end
end

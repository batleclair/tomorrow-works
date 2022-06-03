class OffersController < ApplicationController
  def new
    @offer = Offer.new
    authorize @offer
  end

  def show
    @offer = Offer.find(params[:id])
    @candidature = Candidature.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    authorize @offer
    @offer.user = current_user
    @offer.nonprofit = current_user.nonprofit
  end

  def index
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :expertise, :description, :start_date, :duration, :frequency, :location, :salary)
  end
end

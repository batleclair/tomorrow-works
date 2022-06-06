class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @nonprofits = Nonprofit.all
    @offers = policy_scope(Offer)
    if params[:query].present?
      @offers = @offers.global_search(params[:query])

    else
      @offers = Offer.all
    end
  end

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
    @nonprofit = Nonprofit.find_by(user_id: current_user.id)
    @offer.nonprofit_id = @nonprofit.id
    if @offer.save
      redirect_to nonprofit_my_offers_path(@nonprofit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_offers
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @offers = @nonprofit.offers
    authorize @offers
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :expertise, :description, :start_date, :duration, :frequency, :location, :salary)
  end

end

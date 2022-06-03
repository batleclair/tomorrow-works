class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @offer.nonprofit_id = Nonprofit.where(user_id: current_user.id)[0].id
    if @offer.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @offers = Offer.all
    @offers = policy_scope(Offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :expertise, :description, :start_date, :duration, :frequency, :location, :salary)
  end
end

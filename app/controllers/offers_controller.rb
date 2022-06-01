class OffersController < ApplicationController
  def new
    @offer = Offer.new
    authorize @offer
  end
end

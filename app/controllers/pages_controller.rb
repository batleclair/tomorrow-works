class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @nonprofit = Nonprofit.where(user_id: current_user.id)[0]
    @offers = @nonprofit.offers
    @candidatures = policy_scope(Candidature).where(offer_id: params[:offer_id])
  end

  def profile
    @candidatures = policy_scope(Candidature).where(user: current_user)
    @offers = Offer.where(user_id: current_user.id)[0]
  end
end

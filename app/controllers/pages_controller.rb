class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @candidates = []
    @nonprofit = Nonprofit.where(user_id: current_user.id)[0]
    @offers = @nonprofit.offers
    @offers.each do |offer|
      if offer.candidates.exists?
        offer.candidates.each do |candidate|
          @candidates.push(candidate)
        end
      end
    end
    @candidates.uniq!
  end

  def profile
    @candidatures = policy_scope(Candidature).where(user: current_user)
    @offers = Offer.where(user_id: current_user.id)[0]
  end
end

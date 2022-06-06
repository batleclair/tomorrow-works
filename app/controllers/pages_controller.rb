class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @nonprofit = Nonprofit.where(user_id: current_user.id)[0]
    @offers = @nonprofit.offers
  end
end

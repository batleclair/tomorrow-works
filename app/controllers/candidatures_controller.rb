class CandidaturesController < ApplicationController
  def create
    @candidature = Candidature.new(candidature_params)
    @candidature.user = current_user
    @candidature.candidate = Candidate.find_by(user_id: current_user.id)
    @candidature.offer = Offer.find(params[:offer_id])

    if @candidature.save
      redirect_to profile_path
    else
      render :new, unprocessable: :entity
    end
    authorize @candidature
  end

  def candidature_params
    params.require(:candidature).permit(:motivation)
  end
end

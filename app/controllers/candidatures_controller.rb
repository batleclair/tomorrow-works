class CandidaturesController < ApplicationController

  def index
    @offer = Offer.find(params[:offer_id])
    @candidatures = Candidature.where(offer_id: params[:offer_id])
    @candidatures = policy_scope(Candidature)
  end

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

  def update
    @candidature = Candidature.find(params[:id])
    @candidature.update(candidature_params)
    authorize @candidature
    @offer = Offer.find(@candidature.offer_id)
    respond_to do |format|
      format.html { redirect_to offer_candidatures_path(@offer) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def candidature_params
    params.require(:candidature).permit(:motivation, :status)
  end
end

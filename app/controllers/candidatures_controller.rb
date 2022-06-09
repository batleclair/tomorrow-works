class CandidaturesController < ApplicationController

  def index
    @offer = Offer.find(params[:offer_id])
    @candidatures = policy_scope(Candidature).where(offer_id: params[:offer_id])
  end

  def show
    @candidature = Candidature.find(params[:id])
    @candidate = @candidature.candidate
    @candidature_note = CandidatureNote.new
    @candidature_notes = CandidatureNote.where(candidature_id: @candidature.id)
    authorize @candidature
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
    @candidatures = policy_scope(Candidature).where(offer_id: params[:offer_id])
    render json: json_response
  end

  def accepted
    @candidature = Candidature.find(params[:id])
    authorize @candidature
    @candidature.candidate_validation = true
    @candidature.save
    redirect_to profile_path
  end

  def refused
    @candidature = Candidature.find(params[:id])
    authorize @candidature
    @candidature.status = "dropped"
    @candidature.save
    redirect_to profile_path
  end

  private

  def json_response
    {
      nouveau: @candidatures.where(status: 'nouveau').count,
      etape1: @candidatures.where(status: 'etape1').count,
      etape2: @candidatures.where(status: 'etape2').count,
      validation: @candidatures.where(status: 'validation').count,
      dropped: @candidatures.where(status: 'dropped').count
    }
  end

  def candidature_params
    params.require(:candidature).permit(:motivation, :status)
  end
end

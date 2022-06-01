class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
    @user = current_user
    @candidate.user = current_user
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    @candidate.save
    redirect_to candidate_path(@candidate)
    authorize @candidate
    raise
  end

  private

  def candidate_params
    params.require(:candidate).permit(:user_id, :company_siret, :birthdate, :availability, :expertise, :location, :linkedin_url)
  end
end

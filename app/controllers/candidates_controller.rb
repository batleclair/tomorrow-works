class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
    @user = current_user
    authorize @candidate # Add this line
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.save
    redirect_to candidate_path(@candidate)
    authorize @candidate # Add this line
  end

  private

  def candidate_params
    params.require(:candidate).permit(:birthdate)
  end
end

class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
    @user = current_user
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.save
    redirect_to candidate_path(@candidate)
  end

  private

  def candidate_params
    params.require(:candidate).permit(:birthdate, :address, :rating)
  end

end

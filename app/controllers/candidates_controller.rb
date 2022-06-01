class CandidatesController < ApplicationController
  require 'open-uri'
  require 'json'

  def new
    @candidate = Candidate.new
    authorize @candidate
  end

  def show
    @candidate = Candidate.find(params[:id])
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)
    authorize @candidate
    @company = Company.find_by(user_id: current_user.id)
    @candidate.company = @company
    @candidate.user = current_user
    if @candidate.save
      redirect_to candidate_path(@candidate)
    else
      render :new, unprocessable: :entity
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:user_id, :company_id, :birthdate, :availability, :expertise, :location, :linkedin_url)
  end
end

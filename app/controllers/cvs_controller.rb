class CvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :index, :show]

  def new
    @cv = Cv.new
    @candidate = Candidate.find_by(user_id: current_user.id)
    authorize @cv
  end

  def show
    @cv = CV.find(params[:id])
    authorize @cv
  end

  def create
    @cv = Cv.new(cv_params)
    authorize @cv
    @candidate = Candidate.find_by(user_id: current_user.id)
    @cv.candidate_id = @candidate.id
    if @cv.save
      redirect_to candidate_path(@candidate)
    else
      render :new, unprocessable: :entity
    end
  end

  # def my_cvs
  #   @candidate = Candidate.find(params[:candidate_id])
  #   @cvs = @candidate.cvs
  #   authorize @cvs
  # end

  def cv_params
    params.require(:cv).permit(:titre, :entreprise, :date_début, :date_fin, :description)
  end
end

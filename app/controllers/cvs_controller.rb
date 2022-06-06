class CvsController < ApplicationController
  def show
    @cv = CV.find(params[:id])
    authorize @cv
  end

  def new
    @cv = CV.new
    authorize @cv
  end

  def create
    @cv = CV.new(cv_params)
    @cv.candidate = Candidate.find_by(user_id: current_user.id)
    if @cv.save
      redirect_to candidate_path
    else
      render :new, unprocessable: :entity
    end
    authorize @cv
  end

  def my_cvs
    @candidate = Candidate.find(params[:candidate_id])
    @cvs = @candidate.cvs
    authorize @cvs
  end

  def cv_params
    params.require(:cv).permit(:titre, :entreprise, :date_debut, :date_fin, :description)
  end
end

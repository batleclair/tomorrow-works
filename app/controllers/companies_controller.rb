class CompaniesController < ApplicationController

  def new
    @company = Company.new
    @user = current_user
    @company.user = current_user
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    @company.user = current_user
    if @company.save
      if Candidate.find_by(user_id: current_user.id)
        redirect_to profile_path
      else
        redirect_to new_candidate_path
      end
    else
      render :new, unprocessable: :entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:user_id, :name, :address, :sector, :siret, :status)
  end
end

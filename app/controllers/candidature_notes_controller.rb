class CandidatureNotesController < ApplicationController
  def create
    @candidature_note = CandidatureNote.new(candidature_note_params)
    @candidature_note.user_id = current_user.id
    @candidature_note.candidature = Candidature.find(params[:candidature_id])
    @candidature_note.save
    authorize @candidature_note
    render json: json_response
  end

  def destroy
    @candidature_note = CandidatureNote.find(params[:id])
    @candidature_note.delete
  end

  private

  def json_response
    {
      content: @candidature_note.content,
      author: @candidature_note.user.first_name,
      created_at: @candidature_note.created_at.strftime("%d %b %Y"),
      id: @candidature_note.id
    }
  end

  def candidature_note_params
    params.require(:candidature_note).permit(:content)
  end
end

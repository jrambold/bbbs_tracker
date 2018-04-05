class NotesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @note = contact.notes.new
  end

  def create
    contact = Contact.find(params[:contact_id])
    note = contact.notes.new(note_params)
    if note.save
      redirect_to match_contact_path(contact.match, contact.id)
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:comment)
  end
end

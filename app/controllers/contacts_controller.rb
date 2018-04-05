class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
    @notes = @contact.notes
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    params[:contact] = contact.parse_update(params[:contact])
    contact.update(contact_params)
    if contact.save
      flash[:success] = "Contact updated!"
      redirect_to new_match_contact_note_path(contact.match, contact.id)
    else
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_due, :sor, :yos, :training, :driving, :person)
  end
end

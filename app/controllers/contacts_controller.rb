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
    require 'pry'; binding.pry
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_due, :sor, :yos, :training, :driving, :person)
  end
end

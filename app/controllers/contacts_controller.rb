class ContactsController < ApplicationController
  before_action -> { authorize! @contact, with: ContactPolicy }

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      AdminMailer.contact_email(@contact).deliver
      render :thanks
    else
      render :new
    end
  end
  #redirect_to new_contact_path, notice: "You can leave feedback to the admin"
  # Create a new contact with mailer

  def thanks
  end
end

class ContactsController < ApplicationController
  before_action :authenticate_user!

  def new
    redirect_to new_contact_path, notice: "You can leave feedback to the admin"
  end

  def create
    # Create a new contact with mailer
  end

  def destroy
    redirect_to contact_path(@contact), notice: "Message was successfully canceled."
  end
end

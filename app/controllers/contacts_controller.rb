class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]


  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.valid?
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render 'home'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'home' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

end

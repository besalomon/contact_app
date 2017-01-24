class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
		render "contacts.html.erb"
	end

  def new
    render "form.html.erb"
  end

  def create
    @answer = Contact.new({first_name:params[:first_name], last_name:params[:last_name], email:params[:email] , phone_number:params[:phone_number]})
    @answer.save
    render "success.html.erb"
  end

  def show
    @contact = Contact.find_by(id:params[:id])
    render "contact.html.erb"
  end

  def edit
    @contact = Contact.find_by(id:params[:id])
    render "edit.html.erb" 
  end

  def update
    @contact = Contact.find_by(id:params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save
    render "edited.html.erb"
  end

  def destroy
    @contact = Contact.find_by(id:params[:id])
    @contact.delete
    render "deleted.html.erb"
  end
end
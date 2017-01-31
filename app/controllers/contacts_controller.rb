class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
	end

  def new
   
  end

  def create
    @answer = Contact.new({first_name:params[:first_name], middle_name:params[:middle_name], last_name:params[:last_name], email:params[:email] , phone_number:params[:phone_number], bio:params[:bio]})
    @answer.save
    redirect_to "/contacts"
    flash[:success] = "The contact has been created!"
  end

  def show
    @contact = Contact.find_by(id:params[:id])
  end

  def edit
    @contact = Contact.find_by(id:params[:id])
  end

  def update
    @contact = Contact.find_by(id:params[:id])
    @contact.first_name = params[:first_name]
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.bio = params[:bio]
    @contact.save
    redirect_to "/contacts/#{params[:id]}"
    flash[:success] = "The contact has been updated!"
  end

  def destroy
    @contact = Contact.find_by(id:params[:id])
    @contact.delete
    redirect_to "/contacts"
    flash[:warning] = "The contact has been deleted"
  end

  def search
    search_word = params[:search]
    @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", "%#{search_word}%", "%#{search_word}%")
    render :index
    if @contacts.empty?
      @contacts = Contact.search_all
      render :index
    end
    
  end
end
class UsersController < ApplicationController
  has_many :contacts
  def new
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    user.save

    if user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully Created Account"
      redirect_to '/contacts'
    else
      flash[:warning] = "Invalid Password or Email"
      redirect_to '/signup'
    end
  end
end

class AuthenticationsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def new
    # Are they already logged in?
    if current_user # They are!  Can't create them again.
      redirect_to User.find_by(params[:user])
    else
      @user = User.new
#      render :new
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
        # authenticate user
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to action: 'new'
        else
          alert = "Unable to sign you in. Please try again."
          redirect_to action: 'new'
        end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/authentications/new/",
     notice: "You signed out."
  end


end

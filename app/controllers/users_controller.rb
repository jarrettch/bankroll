class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    User.create(params[:user]
      .permit(:email, :password, :password_confirmation, :visit))
    redirect_to users_url
  end

  def index
    @user = @current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @visit = @user.visits.find(params[:id]).destroy
    redirect_to '/'
  end
end
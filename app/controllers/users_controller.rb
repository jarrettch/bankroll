class UsersController < ApplicationController
  before_action :authenticate_user  
  respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    User.create(params[:user]
      .permit(:email, :password, :password_confirmation, :visit))
    redirect_to action: 'show'
  end

  def index
    @user = @current_user
    @users = User.all
    respond_with(@users) do |format|
      format.json {render :json => @users.as_json }
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
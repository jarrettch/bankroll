class VisitsController < ApplicationController
  before_action :authenticate_user

  def index
    @visits = Visit.all
    @visit = Visit.new
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @visit = Visit.new
  end

  def create
    @user = User.find(params[:user_id])
    @visit = @user.visits.create(params[:visit].permit(:date_played, :location, :visit_type, :stakes, :hours_played, :profit_or_loss, :notes))
    redirect_to :back
  end

  def update
    @visit = @user.visits.find(params[:id])
    if @user.update_attributes(params)
  end

  def destroy
    @user = User.find(params[:user_id])
    @visit = @user.visits.find(params[:id]).destroy
    redirect_to '/'
  end

end
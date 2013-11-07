class VisitsController < ApplicationController
  before_action :authenticate_user

  def index
    @visits = Visit.all
    @visit = Visit.new
  end

  def show
    @user = User.find(params[:user_id])
    @visit = @user.visits.find(params[:id])
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

  def edit
    @user = User.find(params[:user_id])
    @visit = @user.visits.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @visit = @user.visits.find(params[:id])
    if @visit.update_attributes(params[:visit].permit(:date_played, :location, :visit_type, :stakes, :hours_played, :profit_or_loss, :notes))
      redirect_to @user
    else
      @visit = @user.visits.find(params[:id])
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @visit = @user.visits.find(params[:id]).destroy
    redirect_to :back
  end

end
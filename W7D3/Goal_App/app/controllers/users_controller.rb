class UsersController < ApplicationController
  def index
    @user = User.all 
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  
  


end

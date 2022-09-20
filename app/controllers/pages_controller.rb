class PagesController < ApplicationController
  def home
  end

  def index
    @users = User.all
  end

  def toggle_admin()
    selected = User.find(params[:user_id])
    selected.admin = !selected.admin
    selected.save
    redirect_to "/pages/admin"
    flash[:success] = "User admin rights sucessfully toggled"
  end

  def destroy
    selected = User.find(params[:user_id])
    selected.destroy
    redirect_to "/pages/admin"
  end

 


end

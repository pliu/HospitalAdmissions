class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def assign_role
    @userId = params[:userId]
    @user = User.find(@userId)
  end

  def change_user_role
    @userId = params[:userId]
    @user = User.find(@userId)
    @user.role = params[:newRole]
    @user.save!;

    redirect_to('/admin');

  end
end

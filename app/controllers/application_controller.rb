require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == 'staff'
      puts 'Staff'
      return '/'
    elsif current_user.role == 'charge_nurse'
      puts 'Nurse'
      return '/charge_nurse'
    elsif current_user.role == 'doctor'
      puts 'Doctor'
      return '/doctor'
    elsif current_user.role == 'medical_staff'
      puts 'Medical Staff'
      return '/medical'
    else
      puts 'RIP: Weird re-direct after sign in'
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return '/'
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end

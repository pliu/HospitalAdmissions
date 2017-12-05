class StaffController < ApplicationController
  def index
  end

  def patient_info
    puts "PATIENT_INFO"
    puts params
    @patient_info = Patient.where(insurance_string: params[:patID]).take

    puts @patient_info
    render 'patient_info'
  end
end

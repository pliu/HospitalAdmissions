class StaffController < ApplicationController
  def index
  end

  def patient_info
    puts "PATIENT_INFO"
    puts params
    @patId = params[:patId]
    @patient_info = Patient.where(insurance_string: @patId).first

    puts @patient_info

    render 'patient_info'
  end
end

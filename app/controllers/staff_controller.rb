class StaffController < ApplicationController
  def index
  end

  def patient_info
    puts "PATIENT_INFO"
    puts params
    @patId = params[:patId]
    @patient_info = Patient.where(insurance_string: @patId).first
    @division = Division.where(charge_nurse_id: current_user.id).first
    @admissions = @patient_info.admissions
    render 'patient_info'
  end
end

class MedicalController < ApplicationController
  def index
  end

  def create_patient
    @patient = params[:patient]
  end

  def add_patient
    @patient = params[:patient]

    @patient = Patient.new({
      'insurance_string':params[:insurance_string],
      'first_name':params[:first_name],
      'last_name':params[:last_name],
      'address':params[:address],
      'phone_number':params[:phone_number],
      'dob':params[:dob],
      'gender':params[:gender],
      'marital_status':params[:marital_status],
      })
    @patient.save!

    @patId = params[:insurance_string]
    redirect_to('/patient_info?patId='+@patId)
  end
end

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

  def update_patient_file
    @patId = params[:patId]
    @patient = Patient.find(params[:patient])

    render 'update_patient_file'
  end

  def edit_patient_info
    @patId = params[:patId]
    @patient = Patient.find(params[:patient])

    @newInfo = {}
    @newInfo['insurance_string'] = params[:insurance_string].empty? ? @patient.insurance_string : params[:insurance_string]
    @newInfo['first_name'] = params[:first_name].empty? ? @patient.first_name : params[:first_name]
    @newInfo['last_name'] = params[:last_name].empty? ? @patient.last_name : params[:last_name]
    @newInfo['address'] = params[:address].empty? ? @patient.address : params[:address]
    @newInfo['phone_number'] = params[:phone_number].empty? ? @patient.phone_number : params[:phone_number]
    @newInfo['dob'] = params[:dob].empty? ? @patient.dob : params[:dob]
    @newInfo['gender'] = params[:gender].nil? ? @patient.gender : params[:gender]
    @newInfo['marital_status'] = params[:marital_status].nil? ? @patient.marital_status : params[:marital_status]

    @patient.update!(@newInfo)
    redirect_to('/patient_info?patId='+@patId)
  end
end

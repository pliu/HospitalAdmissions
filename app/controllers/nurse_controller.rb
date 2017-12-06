class NurseController < ApplicationController
  def index
  end

  def discharge_patient
    puts 'AA patientInfo', params[:patient];
    puts 'AA patId', params[:patId]

    @admission = Admission.where(patient_id: params[:patient]).first
    puts 'AA adm', @admission
    @admission.destroy
    ##note: database triggers handle incrementing numBeds

    redirect_to '/consult_patient_file'
  end
end

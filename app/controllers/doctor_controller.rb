class DoctorController < ApplicationController
  before_action :authenticate_doctor!

  def index

  end

  def prescribe_medication
    @patient = params[:patient]
    @patId = params[:patId]
  end

  def create_medication
    @drug = Drug.new(name: params[:drug_name] )
    @drug.save!

    puts 'drg', @drug.id

    @patient = params[:patient]
    @patId = params[:patId]

    @prescription = Prescription.new({
                                         'patient_id':@patient,
                                         'drug_id':@drug.id,
                                         'daily_units':params[:daily_units],
                                         'admin_per_day':params[:admin_per_day],
                                         'admin_method':params[:admin_method],
                                         'start':params[:start],
                                         'end':params[:end]
                                     })

    @prescription.save!


    redirect_to('/patient_info?patId='+@patId)
  end

end

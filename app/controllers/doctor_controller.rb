class DoctorController < ApplicationController
  before_action :authenticate_doctor!

  def index

  end

  def prescribe_medication
    puts "PRESCRIBE MEDICATION"
    @patId = params[:patId]
    @patient = params[:patient]

    puts 'id', @patId
    puts 'pat', @patient

  end

  def create_medication

    @drug = Drug.new(name: 'Hello')
    @drug.save

    puts 'drg', @drug.id

    @prescription = Prescription.new({
                                         'patient_id':@patient,
                                         'drugs_id':@drug.id,
                                         'daily_units':params[:daily_units],
                                         'admin_per+day':params[:admin_per_day],
                                         'admin_method':params[:admin_method],
                                         'start':params[:start],
                                         'end':params[:end]
                                     })

    @prescription.save

    redirect_to :action => '/patient_info'
  end

end

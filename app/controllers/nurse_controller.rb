class NurseController < ApplicationController
  def index
  end

  def admit_patient
    @patientId = params[:patient]
    @division = get_charge_division
    @patId = params[:patId]
  end

  def create_admission
    @patient = params[:patient]
    @division = params[:divisionId]
    @patId = params[:patId]

    if (Division.find(@division).status == 'full')
      redirect_to '/lack_permission?msg=Can not admit patient. That division is full.'
      return
    end

    admission = Admission.new({
                                  patient_id: @patient,
                                  division_id: @division,
                                  room_num: params[:room_num],
                                  bed_num: params[:bed_num],
                                  insurance_string: params[:insurance_number]
                              })

    admission.save!

    redirect_to('/patient_info?patId=' + @patId)
  end

  def discharge_patient
    charge_division = get_charge_division
    @admission = Admission.where(patient_id: params[:patient]).first
    @permission_to_discharge = !charge_division.nil? && charge_division.id == @admission.division_id

    if (@permission_to_discharge)
      @admission.destroy
      redirect_to('/patient_info?patId=' + params[:patId])
    else
      redirect_to '/lack_permission?msg=You lack discharge permissions.'
    end
  end

  def get_charge_division
    division = Division.where(charge_nurse_id: current_user.id).first
    return division
  end
end

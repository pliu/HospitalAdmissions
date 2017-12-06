class NurseController < ApplicationController
  def index
  end

  def discharge_patient
    charge_division = get_charge_division
    @admission = Admission.where(patient_id: params[:patient]).first
    @permission_to_discharge = !charge_division.nil? && charge_division.id == @admission.division_id

    if(@permission_to_discharge)
      @admission.destroy
      redirect_to('/patient_info?patId='+params[:patient])
    else
      redirect_to '/lack_permission?msg=You lack discharge permissions.'
    end
  end

  def has_discharge_permission?

  end

  def get_charge_division
    division = Division.where(charge_nurse_id: current_user.id).first
    return division
  end
end

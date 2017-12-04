class AdmissionUniquePatient < ActiveRecord::Migration[5.0]
  def change
    remove_index :admissions, name: 'index_admissions_on_patient_id'
    add_index :admissions, :patient_id, unique: true
  end
end

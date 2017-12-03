class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.belongs_to :patient, :null => false
      t.timestamps
    end
  end
end

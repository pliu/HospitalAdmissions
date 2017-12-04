class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false
      t.references :drug, null: false
      t.integer :daily_units, null: false
      t.integer :admin_per_day, null: false
      t.string :admin_method, null: false
      t.datetime :start, null: false
      t.datetime :end

      t.timestamps
    end
  end
end

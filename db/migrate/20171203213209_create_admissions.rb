class CreateAdmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :admissions do |t|
      t.references :patient, null: false
      t.references :division, null: false
      t.integer :room_num, null: false
      t.integer :bed_num, null: false
      t.string :insurance_string

      t.timestamps
    end
  end
end

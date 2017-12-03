class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :insurance_string, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.datetime :dob, null: false
      t.integer :gender, null: false
      t.integer :marital_status, null: false
      t.text :nok

      t.index :insurance_string, unique: true

      t.timestamps
    end
  end
end

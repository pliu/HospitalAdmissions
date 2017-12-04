class CreateAdmissionRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :admission_requests do |t|
      t.references :patient, null: false
      t.references :division, null: false
      t.text :rational
      t.integer :priority

      t.timestamps
    end
  end
end

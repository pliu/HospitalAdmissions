class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.references :charge_nurse, null: false
      t.string :division_name, null: false
      t.string :location, null: false
      t.integer :total_beds, null: false
      t.string :extension, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end

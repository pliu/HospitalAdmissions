class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.references :charge_nurse,

      t.timestamps
    end
  end
end

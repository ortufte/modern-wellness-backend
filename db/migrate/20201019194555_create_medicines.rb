class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.integer :user_id
      t.string :name
      t.string :dosage
      t.text :note

      t.timestamps
    end
  end
end

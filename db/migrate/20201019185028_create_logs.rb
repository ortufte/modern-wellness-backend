class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.date :date
      t.string :medicine
      t.integer :symptom_level
      t.text :note

      t.timestamps
    end
  end
end

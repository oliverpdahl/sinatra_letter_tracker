class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.string :notes
      t.datetime :date_sent
      t.datetime :date_received

      t.timestamps null: false
    end
  end
end

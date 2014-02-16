class CreateMoodData < ActiveRecord::Migration
  def change
    create_table :mood_data do |t|
      t.datetime :entry_at
      t.integer :mood
      t.integer :sleep
      t.integer :irritability
      t.integer :anxiety
      t.text :comments
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end

class CreatePatientSignificantEvents < ActiveRecord::Migration
  def change
    create_table :patient_significant_events do |t|
      t.text :comments
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :mood_data_id
      t.timestamps
    end
  end
end

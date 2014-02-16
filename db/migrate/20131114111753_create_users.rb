class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :password_digest
      t.integer :role_id
      t.integer :doctor_id  
      t.timestamps
    end
  end
end

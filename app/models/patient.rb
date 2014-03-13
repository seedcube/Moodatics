class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
     
  self.table_name = :users 
  
  
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true , :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } , uniqueness: true
  validates :role_id, presence: true 
  validates :password, presence: true
  validates :password_confirmation, presence: true  
  validates :username, uniqueness: true , presence: true 
  
  attr_accessor  :password, :password_confirmation
  
  has_many :mood_data  
  
  def full_name
       "#{self.first_name.to_s}  #{self.last_name.to_s}"
  end 
end

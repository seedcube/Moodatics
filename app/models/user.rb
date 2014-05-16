class User < ActiveRecord::Base  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true , :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
  validates :role_id, presence: true   
  validates :username, uniqueness: true , presence: true  
  
  attr_accessor :login
    
  
  has_many :mood_data  
  
  def full_name
       "#{self.first_name.to_s}  #{self.last_name.to_s}"
  end 
  
  def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        else
          where(conditions).first
        end
  end
  
  def group_id  # overriding previous definition of 'group_id'
     nil
  end
  

end

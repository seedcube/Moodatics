class MoodDatum < ActiveRecord::Base 
  belongs_to :user
  validates :entry_at, presence: true 
  validates :sleep, presence: true  
  validates :irritability, presence: true  
  validates :mood, presence: true  
  validates :anxiety, presence: true 
  
   
end

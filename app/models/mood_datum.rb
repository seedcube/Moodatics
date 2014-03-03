class MoodDatum < ActiveRecord::Base 
  belongs_to :user
  validates :entry_at, presence: true 
  validates :sleep, presence: true  
  validates :irritability, presence: true  
  validates :mood, presence: true  
  validates :anxiety, presence: true 
  
  def mood_name 
     if self.mood == 1
       return  'Mild'
     elsif self.mood == 2
       return 'Moderate'
     elsif self.mood == 3  
       return 'Severe'
     end      
  end   
end

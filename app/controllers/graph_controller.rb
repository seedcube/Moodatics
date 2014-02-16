class GraphController < ApplicationController
  def index 
    if params[:user]   
     @user = User.find(params[:user]) 
     @mood_data = @user.mood_data
    end     
  end
end

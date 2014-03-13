class BusinessAdminController < ApplicationController
  def index    
      @users = User.where(:role_id => 1)   
  end
  def delete_doctor  
    @user = User.find(params[:user_id]) 
    if @user.role_id == 1 
      @patients = User.where(:doctor_id => @user.id)
        @patients.each do |patient| 
          patient.destroy
        end 
    end
    @user.destroy  
    
    redirect_to admin_path
  end
end

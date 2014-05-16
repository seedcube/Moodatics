class BusinessAdminController < ApplicationController  
  before_filter :only_bussiness_admin 
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
  def edit_doctor  
    @user = User.find(params[:user_id]) 
  end 
  def update_doctor
    @user = User.find(params[:user_id])
    if params[:user][:password].blank?
       params[:user].delete("password")
       params[:user].delete("password_confirmation")
   end  
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/admin', notice: 'User was successfully updated.' } 
        format.json { head :no_content }
      else
        format.html { render action: 'edit_doctor' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :middle_name, :email, :password, :username, :password_confirmation)
  end  
  
  
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  
      if user.role_id == 1 
        #redirect_to doctor_dashboard_index_path, notice: "Logged in!" 
       redirect_to users_path(:doctor => current_user.id), notice: "Logged in!" 
      elsif user.role_id == 2
        #redirect_to patient_dashboard_index_path, notice: "Logged in!" 
        redirect_to new_mood_datum_path(:patient => current_user.id), notice: "Logged in!"  
      else   
        redirect_to root_url, notice: "Logged in!" 
      end
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

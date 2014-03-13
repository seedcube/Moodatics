class UsersController < Devise::SessionsController    
  #before_filter :authorize,  only: [:show, :edit, :update, :destroy]   
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    
     if params[:doctor] 
       @users = User.where(:doctor_id => current_user.id)
     else
       @users = User.all 
     end   
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new 
    @mode = nil  
    if current_user
      if params[:doctor]  
        @mode = true
      end  
    end 
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create    
    raise
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if current_user
        format.html { redirect_to users_path(:doctor => current_user.id ), notice: 'User was successfully created.' } 
        else  
         format.html { redirect_to login_path, notice: 'User was successfully created.' }
        end  
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if current_user
          format.html { redirect_to users_path(:doctor => current_user.id ), notice: 'User was successfully created.' } 
        else  
          format.html { redirect_to login_path, notice: 'User was successfully created.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path(:doctor => current_user.id ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :middle_name, :email, :password, :password_confirmation,:role_id,:doctor_id)
    end
end

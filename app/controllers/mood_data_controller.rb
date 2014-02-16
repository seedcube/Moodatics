class MoodDataController < ApplicationController 
  before_filter :authorize
  before_action :set_mood_datum, only: [:show, :edit, :update, :destroy]
  # GET /mood_data
  # GET /mood_data.json
  def index   
      if params[:user]   
        @user = User.find(params[:user])  
        @datas = []
        @mood_data = @user.mood_data    
        if @mood_data.size > 7
           @mood_data = @mood_data.limit(7).order('created_at DESC') 
           @mood_data.each do |d|
              @datas << d.entry_at.strftime("%d %b %Y at %I:%M%p") 
           end   
        else   
           @mood_data.each do |d| 
              @datas << d.entry_at.strftime("%d %b %Y at %I:%M%p") 
              
           end
          
        end    
       end
  end

  # GET /mood_data/1
  # GET /mood_data/1.json
  def show
  end

  # GET /mood_data/new
  def new 
     @mode = nil 
     if current_user
        if params[:patient]  
          @mode = true
        end  
      end
      @mood_datum = MoodDatum.new
  end

  # GET /mood_data/1/edit
  def edit
  end

  # POST /mood_data
  # POST /mood_data.json
  def create
    @mood_datum = MoodDatum.new(mood_datum_params)

    respond_to do |format|
      if @mood_datum.save
        format.html { redirect_to new_mood_datum_path(:patient => current_user.id), notice: 'Mood datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mood_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @mood_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mood_data/1
  # PATCH/PUT /mood_data/1.json
  def update
    respond_to do |format|
      if @mood_datum.update(mood_datum_params)
        format.html { redirect_to @mood_datum, notice: 'Mood datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mood_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mood_data/1
  # DELETE /mood_data/1.json
  def destroy
    @mood_datum.destroy
    respond_to do |format|
      format.html { redirect_to mood_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_datum
      @mood_datum = MoodDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_datum_params
      params.require(:mood_datum).permit(:entry_at, :mood, :sleep, :irritability, :anxiety, :comments, :user_id, :doctor_id)
    end
end

class TimersController < ApplicationController

	def new 
		if !logged_in?
			redirect_to "/login"
		else
		@timer = Timer.new
	end 
end 

	def create
		@timer = current_user.timers.new(timer_params)
		# @las = Lat.find(params[:id])
		# @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  # 	marker.lat user.latitude
  # 	marker.lng user.longitude
		if @timer.save
		  flash[:notice] = "your time is saved successfully"
		  redirect_to "/users/leaderboard"
		else 
			flash[:notice] = "You have not logged in yet"
			redirect_to	"/login"
		end
	end 

def show
 	@timer = Timer.find(params[:id])
 end 


 def destroy

    @timer = Timer.find(params[:id])
    @timer.destroy
    respond_to do |format|
    	format.html { redirect_to root_path, notice: "Project was successfully destroy. "}
    	format.json { render json: { id: params[:id]} }
    end
  end 


  def leaderboard

     @filterrific = initialize_filterrific(
        Timer,
        params[:filterrific]
      ) or return

      @timer = @filterrific.find

 end 



	def timer_params
	  params.require(:timer).permit(:time ,:longitude, :latitude, {photos: []})
	end 


  def user_photo 
    
  @timer = Timer.find(params[:id])

  end 

end 


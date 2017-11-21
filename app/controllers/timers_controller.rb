class TimersController < ApplicationController

	def new 
		@timer = Timer.new
	end 

	def create
		@timer = current_user.timers.new(timer_params)
		@las = La.find(params[:id])
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  	marker.lat user.latitude
  	marker.lng user.longitude
		if @timer.save
		  flash[:notice] = "your time is saved successfully"
		  redirect_to "/users/leaderboard"
		else 
			flash[:notice] = "You have not logged in yet"
			redirect_to	"/login"
  	end 
	end
end 

 def destroy

    @timer = Timer.find(params[:id])
    @listing.destroy
    redirect_to "/users/profile"
    
  end 


  def leaderboard

     @filterrific = initialize_filterrific(
        Timer,
        params[:filterrific]
      ) or return

      @timer = @filterrific.find

 end 


 def photo
 	@timer = Timer.all
 end 


	def timer_params
	  params.require(:timer).permit(:time ,:venue,  {photos: []})
	end 

end 


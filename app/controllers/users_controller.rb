class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def show
    if logged_in?
    @timer = current_user.timers
  else 
    redirect_to "/login"
  end 
end 

  def create
  	@user = User.new(user_params)
    if @user.save 
    	session[:user_id] = @user.id
      redirect_to "/timers/new", notice: "User successfully created"
    else
       @user.errors.full_messages.inspect
    end
  end

   
  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(birthday: user_params[:birthday], country: user_params[:country])
      redirect_to "/users/show"
    else 
      flash[:danger] = 'Error submtting info'
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :birthday, :email, :country, :gender, :password)
  end
end
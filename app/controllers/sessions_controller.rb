class SessionsController < ApplicationController

	def new

	end


  def create
    user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
       sign_in user
      render :template => "/users/show"
    else
      flash[:error] = 'Invalid email/password combination'
      render :template => "/users/new"

    end 
  end 

#    @user_login = User.find_by(email: params[:email])
#   if !@user_login.nil? && @user_login.authenticate(params[:password])
#     session[:user_id]= @user_login.id
#     flash[:danger] = "already logged in"x
#     flash[:notice] = "Please Sign up"
#     redirect '/users/new'
#   end
# end

def show
  end 


 def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = "You've logged out"
    redirect_to "/login"

  end 

   def create_from_omniauth
      auth_hash = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
      if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
        @next = profile_path
        @notice = "Signed in!"
      # else: user logs in with OAuth for the first time
      else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        # you are expected to have a path that leads to a page for editing user details
        @next = edit_user_path(user)
        @notice = "User created. Please confirm or edit details"
      end

      sign_in(user)
      redirect_to @next, :notice => @notice
    end

end 
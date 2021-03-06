class UsersController < ApplicationController

      def new
      	  @user = User.new
      end

      def create
      	  @user = User.new(user_params)
	  if @user.save
	     UserMailer.registration_confirmation(@user).deliver
	     flash[:success] = "please confirm your email address to continue"
	     redirect_to root_url
	  else
	     flash[:error] = "oops, something went wrong"
	     render 'new'
	  end
      end

      def confirm_email
      
	user = User.find_by_confirm_token(params[:id])
	if user
	   user.email_activate
	   user.email_confirmed = true
	   flash[:success] = "Welcome, your email has been confirmed"
	   redirect_to root_url
	else
		flash[:error] = "email doesn't exist"
		redirect to root_url
	end
      end


      private
	def user_params
	    params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end

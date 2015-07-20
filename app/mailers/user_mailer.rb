class UserMailer < ApplicationMailer

default :from => 'notifications@example.com'
 
  def registration_confirmation(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
  end

  def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Password Reset"
  end

end

class UserMailer < ActionMailer::Base
  default from: "from@example.com"
	helper ApplicationHelper

	def welcome_email(restaurant)
    @user = restaurant
    @url  = 'localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')		
  end
end

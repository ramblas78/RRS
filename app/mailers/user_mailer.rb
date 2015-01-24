class UserMailer < ActionMailer::Base
  default from: "from@example.com"
	
	def welcome_email(restaurant)
    @user = restaurant
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')		
  end
end

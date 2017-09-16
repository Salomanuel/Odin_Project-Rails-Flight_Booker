class PassengerMailer < ApplicationMailer
	default from: 'manuel@example.com'

	def welcome_email(user)
		@user = user
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Welcome mate')
	end
end

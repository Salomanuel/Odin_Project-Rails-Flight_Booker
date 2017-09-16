class PassengerMailer < ApplicationMailer
	default from: 'manuel@example.com'

	def welcome_email(user)
		@user = user
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Welcome mate')
	end

	def booking_email(passenger)
		@passenger = passenger
		@booking   = @passenger.booking
		@flight    = @booking.flight
		mail(to: @passenger.email, subject: 'Your booking')
	end
end


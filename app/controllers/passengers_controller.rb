class PassengersController<ApplicationController
	def create
		@passenger = Passenger.new(passenger_params)
		# @booking   = Booking.find(params[:id])
		if @passenger.save
			render inline: "<h1>ok</h1>"
		else
			render inline: "<h1>oh no</h1><%= @passenger.errors.messages %>"
		end
	end
	private
		def passenger_params
			params.require(:passenger).permit(:name, :email, :booking_id)
		end
end
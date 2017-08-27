class PassengersController < ApplicationController
	def create
		@passenger = Passenger.new(passenger_params)

	# 	@booking = Booking.new(booking_params)
		if @passenger.save
			@booking = @passenger.create_booking(flight_id: passenger_params[:flight_id])
			# render html: "saved"
			redirect_to Booking.last # SO WRONG
		else
			render html: "PROBLEM"
		end
	end

	private
		def passenger_params
			params.require(:passenger).permit(:name, 
				:email, :flight_id)
		end
end

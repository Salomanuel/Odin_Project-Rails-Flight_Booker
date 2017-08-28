class BookingsController < ApplicationController
	def new
		@booking		= Booking.new
		@flight  		= Flight.find(params[:booking][:flight_id])
	end

	def create
		@flight  					= Flight.find(params[:flight_id])
		@booking 					= @flight.bookings.build(booking_params)
		permitted_params 	= booking_params.to_h
		@passenger  			= permitted_params[:passenger_attributes]
		if @booking.save! # the bang is for debug in development
			redirect_to @booking
		else
			render html: "oh no"
		end
	end

	def show
		@booking 		= Booking.find(params[:id])
		# @passenger 	= @booking.passenger
		@flight 		= @booking.flight
	end

	private
		def booking_params
			params.require(:booking).permit(
				:flight_id, 
				passengers_attributes: [:name, :email]
			)
		end
end
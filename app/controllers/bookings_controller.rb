class BookingsController < ApplicationController
	def new
		@passenger  = Passenger.new
		@flight  		= Flight.find_by(:id[params[:booking][:flight_id]])
	end

	def show
		@booking 		= Booking.find_by(params[:id])
		@passenger 	= @booking.passenger
		@flight 		= @booking.flight
	end

	private
		def booking_params
			params.require(:booking).permit(:flight_id,
				:name, :email)
		end
end

class BookingsController < ApplicationController
	def new
		@booking = Booking.new
		@flight  = Flight.find_by(:id[params[:booking][:flight_id]])
	end

	# def create
	# 	@booking = Booking.new(booking_params)
	# 	if @booking.save
	# 		# render html: "saved"
	# 		# render @booking
	# 	end
	# end

	private
		def booking_params
			params.require(:booking).permit(:flight_id)
		end
end

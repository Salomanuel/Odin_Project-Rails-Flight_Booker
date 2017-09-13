class BookingsController<ApplicationController

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			redirect_to @booking
		else
			render inline: "<h1>oh no</h1"
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private
		def booking_params
			params.require(:booking).permit(:flight_id, :passengers_number)
		end

end
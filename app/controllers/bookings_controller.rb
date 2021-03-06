class BookingsController<ApplicationController

	def new
		if params[:flight_id]
			@flight = Flight.find(params[:flight_id])
		else
			redirect_to "/search"
			flash[:danger]   = "no flight was selected (with javascript we would not start from scratch when this happens)"
		end
		@passengers_number = params[:passengers_number].to_i
		@booking					 = Booking.new
		@passengers_number.times{ @booking.passengers.build }
		@ordinal_numbers   = ["First","Second","Third","Fourth"]
	end


	def create
		@flight  = Flight.find(params[:booking][:flight])
		@booking = @flight.bookings.new(booking_params)
		if @booking.save
			redirect_to @booking
		else
			render inline: "<h1>oh no</h1><p><%= @booking.errors.messages %>"
		end
	end

	def show
		@booking = Booking.find(params[:id])
		# @booking.passengers_number.times do |i|
		@passenger = @booking.passengers.new
		# end
	end

	def index
		@bookings = Booking.all
	end

	private
		def booking_params
			params.require(:booking).permit(:flight_id, :passengers_number,
										passengers_attributes: [:name, :email] )
		end

end
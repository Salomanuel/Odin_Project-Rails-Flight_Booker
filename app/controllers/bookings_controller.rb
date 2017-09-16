class BookingsController<ApplicationController

	def new
		@flight 					 = Flight.find(params[:flight_id])
		@passengers_number = params[:passengers_number].to_i
		@booking					 = Booking.new
		@passengers_number.times{ @booking.passengers.build }
	end


	def create
		@flight  		= Flight.find(params[:booking][:flight])
		@booking 		= @flight.bookings.new(booking_params)
		@passengers = @booking.passengers.build
		
		respond_to do |format|
			if @booking.save
				# tell the PassengerMailer to send an email after saving
				PassengerMailer.welcome_email(@passenger).deliver_later
				format.html {redirect_to( @booking, notice: "user was created") }
				format.json {render json: @passenger, status: :created, location: @passenger }
			else
				render inline: "<h1>oh no</h1><p><%= @booking.errors.messages %>"
			end
		end
	end

	def show
		@booking = Booking.find(params[:id])
		@passenger = @booking.passengers.new
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
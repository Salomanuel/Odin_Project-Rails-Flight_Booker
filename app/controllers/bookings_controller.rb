class BookingsController < ApplicationController
	def new
		@booking		= Booking.new
		@flight  		= Flight.find([params[:booking][:flight_id]])
	end

	def create
		@booking 		= Booking.new(booking_params)
		permitted_params = booking_params.to_h
		@passenger  = permitted_params[:passenger_attributes]

		if @booking.save
			redirect_to @booking
		else
			render html: "oh no"
		end
	end

	def show
		@booking 		= Booking.find_by(params[:id])
		@passenger 	= @booking.passenger
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
# Parameters: 
# {"booking"=>{
# 		"passengers"=>{
# 			"name"=>"nested", 
# 			"email"=>""}}, 
# 	"flight_id"=>"1", "commit"=>"Book the flight"}

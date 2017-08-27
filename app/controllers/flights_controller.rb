class FlightsController<ApplicationController

	def index
		@airports = Airport.all.map{ |a| [a.name, a.id] }
		if params[:flight_query]
			@booking = Booking.new
			@flights = Flight.where(
				start_airport_id: params[:flight_query][:start_airport_id],
				end_airport_id: 	params[:flight_query][:end_airport_id]
				)
		end
		
	end


end
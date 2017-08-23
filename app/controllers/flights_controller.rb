class FlightsController<ApplicationController

	def index
		@airports = Airport.all.map{ |a| [a.name, a.id] }
		if params[:flight_query]
			# @flight  = params[:flight_query]
			@flights = Flight.where(
				start_airport_id: params[:flight_query][:start_airport_id],
				end_airport_id: 	params[:flight_query][:end_airport_id]
				)

			# Airport.all.find_by(id:@flight[:start_airport_id])
		end
		
	end


end
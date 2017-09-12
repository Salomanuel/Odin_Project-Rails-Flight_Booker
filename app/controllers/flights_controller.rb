class FlightsController < ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all
	end

	def search
		@airports_select = Airport.all.map{ |a| [a.name, a.id] }

		@flight_days = Flight.all.map{ |x| x.date.strftime("%a, %b %d %Y") }.uniq

		if params[:submitted]
			@flights = Flight.where("departure_airport = ? AND arrival_airport = ?",
				params[:departure_airport], params[:arrival_airport])
		end
	
		@booking = "ok"
	end

end
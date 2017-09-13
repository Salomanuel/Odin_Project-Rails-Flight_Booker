class FlightsController < ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all
	end

	def search
		@airports_select = Airport.all.map{ |a| [a.name, a.id] }
		@flight_days = Flight.order(:date).map{ |x| x.date.strftime("%a, %b %d %Y") }.uniq
		@booking = "ok"
		if params[:submitted]
			@flights = find_flight(params[:date], 
														 params[:departure_airport], 
														 params[:arrival_airport]    )
		end
	
		
	end

	private
		def find_flight(my_date, departure, arrival)
			Flight.find_by_sql [ "SELECT * FROM flights 
				WHERE departure_airport = ? 
				AND arrival_airport = ?
				AND strftime('%d %m %Y', date) = ?", 
				departure, arrival,
				Time.parse(my_date).strftime('%d %m %Y')]
		end

end
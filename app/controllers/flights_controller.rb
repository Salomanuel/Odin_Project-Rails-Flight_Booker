class FlightsController < ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all
	end

	def search
		@airports_select   = Airport.all.map{ |a| [a.name, a.id] }
		@flight_days = Flight.order(:date).map{ |x| x.date.strftime("%a, %b %d %Y") }.uniq

		@departure_airport ||= @airports_select[0]
		@arrival_airport   ||= @airports_select[1]
		@date							 ||= @flight_days[0]

		@booking = Booking.new
		if params[:submitted]
			@flights = find_flight(params) 
			if !@flights.any?
				flash.now[:warning] = "no flights found, try another combination"
				if same_airports?
					flash.now[:warning] = "Come on, that flight is way too short, please select different departure and arrival airports"
				end
			end
		end
	end

	def same_airports?
		return true if params["departure_airport"] == params["arrival_airport"]
		return false
	end
	helper_method :same_airports?

	private
		def find_flight(params) #(my_date, departure, arrival)
			@departure_airport = params[:departure_airport]
			@arrival_airport   = params[:arrival_airport]
			@date							 = params[:date]
			Flight.find_by_sql [ "SELECT * FROM flights 
				WHERE departure_airport 			 	 = ? 
				AND 	arrival_airport 					 = ?
				AND 	extract(day from date)     = ?
				AND   extract(month from date)   = ?",
					params["departure_airport"], 
					params["arrival_airport"],
					Time.parse(params["date"]).strftime('%d').to_i,
				  Time.parse(params["date"]).strftime('%m').to_i]
		end

end
class FlightsController < ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all
	end

	def search
		@airports_select = Airport.all.map{ |a| [a.name, a.id] }
		@flight_days = Flight.order(:date).map{ |x| x.date.strftime("%a, %b %d %Y") }.uniq
		@booking = Booking.new
		@flights = find_flight(params) if params[:submitted]
	end

	private
		def find_flight(params) #(my_date, departure, arrival)
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
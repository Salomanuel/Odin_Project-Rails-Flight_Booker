class FlightsController < ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all
	end

	def search
		@flights ||= Array.new
		@airports_select = Airport.all.map{ |a| [a.name, a.id] }
		if params[:arrival_airport]
			@flights = Flight.where("departure_airport = ? AND arrival_airport = ?",
				params[:departure_airport], params[:arrival_airport])
		end
		@booking = "ok"
	end

end
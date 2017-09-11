class FlightsController < ApplicationController

	def index
		@airports = Airport.all
		@flights  = Flight.all

		@airports_select = Airport.all.map{ |a| [a.name, a.id] }
	end

end
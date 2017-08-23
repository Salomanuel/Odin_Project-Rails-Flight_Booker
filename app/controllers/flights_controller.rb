class FlightsController<ApplicationController

	def index
		@flights  = Flight.all
		@airports = Airport.all.map{ |a| [a.name, a.id] }
		
	end


end
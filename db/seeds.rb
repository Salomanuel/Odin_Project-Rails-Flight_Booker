Airport::delete_all
Flight::delete_all

cities = ["Roma", "Paris", "London", "Berlin", "Madrid"].sort

cities.each do |city|
	Airport.create(name: city)
end

def random_airport(airport = nil)
	other_airport = Airport.all[rand(Airport.all.count)]
	if other_airport == airport
		random_airport(airport) 
	else 
		return other_airport
	end
end

200.times do |i|
	flight = Flight.new
	flight.departure_airport = random_airport
	flight.arrival_airport   = random_airport(flight.departure_airport)
	flight.date = Time.now + rand(500000).seconds
	flight.save
end


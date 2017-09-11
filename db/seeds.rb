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

50.times do |i|
	flight = Flight.new
	flight.departure_airport = random_airport.id
	flight.arrival_airport   = random_airport(Airport.find(flight.departure_airport)).id
	flight.date = Time.now + rand(1000000).seconds
	flight.save
end


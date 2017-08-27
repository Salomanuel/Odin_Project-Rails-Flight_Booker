Airport::delete_all
Flight::delete_all



cities = ["Roma", "Madrid", "London", "Paris", "Berlin"]
cities.each{ |c| Airport.create!(name: c) }


15.times do
	start_airport = Airport.all.sample.id
	end_airport   = Airport.all.sample.id
	date          = Time.now + rand(5000000)
	while start_airport == end_airport
		end_airport = Airport.all.sample.id
	end

	Flight.create!(start_airport_id: start_airport,
		             end_airport_id:   end_airport,
		             date: 						 date)
end
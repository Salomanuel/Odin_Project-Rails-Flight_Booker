Airport::delete_all
Flight::delete_all


10.times do
	Airport.create!(name:	Faker::Address.city )
end

15.times do
	start_airport = Airport.all.sample.id
	end_airport   = Airport.all.sample.id
	while start_airport == end_airport
		end_airport = Airport.all.sample.id
	end

	Flight.create!(start_airport_id: start_airport,
		             end_airport_id:   end_airport)
end
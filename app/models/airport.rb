class Airport < ApplicationRecord
	has_many :departures,
		foreign_key: "departure_airport",
		class_name: "Flight"
	has_many :arrivals,
		foreign_key: "arrival_airport",
		class_name: "Flight"
end
class Flight < ApplicationRecord
	belongs_to :start_airport, 	class_name: "Airport"
	belongs_to :end_airport,		class_name: "Airport"
	has_many :bookings
end
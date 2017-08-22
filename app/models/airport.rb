class Airport < ApplicationRecord
	has_many :flights, foreign_key: :start_airport_id
	has_many :flights, foreign_key: :end_airport_id
end

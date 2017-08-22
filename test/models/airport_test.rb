require 'test_helper'

class AirportTest < ActiveSupport::TestCase
	def setup
		@gal = Airport.create(name: "Gallipoli", icao: "LIBG")
	end

	test "it should be valid" do
		assert @gal.valid?
	end
end

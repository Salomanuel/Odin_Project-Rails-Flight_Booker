class AddPassengersNumberToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :passengers_number, :integer
  end
end

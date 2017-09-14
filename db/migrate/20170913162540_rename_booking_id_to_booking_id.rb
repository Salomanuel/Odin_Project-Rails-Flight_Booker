class RenameBookingIdToBookingId < ActiveRecord::Migration[5.1]
  def change
  	remove_index  :passengers, :Booking_id
		rename_column :passengers, :Booking_id, :booking_id
  end
end

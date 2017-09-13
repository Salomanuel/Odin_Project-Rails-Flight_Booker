class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :Booking, foreign_key: true

      t.timestamps
    end
  end
end

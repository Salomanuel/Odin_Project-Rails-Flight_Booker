class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :start_airport_id
      t.integer :end_airport_id
      t.datetime :date
      t.integer :lenght

      t.timestamps
    end
  end
end

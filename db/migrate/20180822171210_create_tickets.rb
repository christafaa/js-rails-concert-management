class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :concert_id
      t.integer :attendee_id
      t.integer :seat_number
    end
  end
end

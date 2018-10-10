class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :profession
      t.integer :age
      t.integer :wealth_rating
      t.text :notes
      t.integer :user_id
    end
  end
end

class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :composer
      t.integer :date_composed
      t.integer :concert_id
    end
  end
end

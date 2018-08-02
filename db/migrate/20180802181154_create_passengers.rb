class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.references :tour_booking, foreign_key: true
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end

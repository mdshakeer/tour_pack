class CreateTourBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_bookings do |t|
      t.references :user, foreign_key: true
      t.references :tour_package, foreign_key: true
      t.string :name
      t.string :contact
      t.text :address
      t.integer :number_of_people
      t.boolean :confirmation, :default => false

      t.timestamps
    end
  end
end

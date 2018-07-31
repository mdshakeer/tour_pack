class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.references :tour_package, foreign_key: true
      t.string :point
      t.date :date

      t.timestamps
    end
  end
end

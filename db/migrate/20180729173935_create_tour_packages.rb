class CreateTourPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_packages do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :age_from
      t.integer :age_upto
      t.integer :max_people
      t.float :cost_per_person
      t.date :last_submission_date
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end

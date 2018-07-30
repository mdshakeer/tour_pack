json.extract! tour_package, :id, :user_id, :name, :age_from, :age_upto, :max_people, :cost_per_person, :last_submission_date, :active, :created_at, :updated_at
json.url tour_package_url(tour_package, format: :json)

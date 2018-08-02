module TourPackagesHelper

	def display_destinations(ds)
		ds.collect(&:name_date).join(",")
	end
end

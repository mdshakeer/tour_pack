module Searchable
	extend ActiveSupport::Concern

	included do
	end

	module ClassMethods
		def search_tour_pack(q,page=1)
			TourPackage.search q,
				page: page,
				per_page: 20
		end	
	end
end
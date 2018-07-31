module Searchable
	extend ActiveSupport::Concern

	included do
	end

	module ClassMethods
		def search_tour_pack(q,page=1)
			q = (q == "") ? "*" : q
			TourPackage.search q,
				page: page,
				per_page: 20
		end	

		def filter_tour_pack(s,d,date,page=1)
			dests = (s != "") ? Destination.where(point:"Start",name:s) : Destination.all
			puts "#{dests.count}--------------"
			dests = (d != "") ? dests.where(point:"End",name:d) : dests
			puts "#{dests.count}--------------"
			dests = (date != "") ? dests.where(point:"Start",date:date) : dests
			puts "#{dests.count}--------------"
			TourPackage.search "*",
				where: {id: dests.collect(&:tour_package_id)},
				page: page,
				per_page: 20
		end
	end
end
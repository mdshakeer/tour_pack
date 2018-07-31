class DestinationsController < ApplicationController
	def new
		@destination = TourPackage.new
	    respond_to do |format|
	      format.js
	    end
	end
end
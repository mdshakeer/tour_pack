class DestinationsController < ApplicationController
	def new
		@destination = Destination.new
	    respond_to do |format|
	      format.js
	    end
	end
end
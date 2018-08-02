class TourBookingController < ApplicationController
	before_action :find_tour_package
	before_action :find_tour_booker_if_exist, :only => [:tour_booker_create]
	before_action :check_if_already_booked
	before_action :find_tour_booker, :only => [:tour_members,:tour_member_create,:tour_confirm,:tour_confirm_done]

  def tour_booker
  	unless (@tour_booking = @tour_package.tour_bookings.find_by_user_id(current_user))
  		@tour_booking = current_user.tour_bookings.new
  	end
  end

  def tour_booker_create
  	if @tour_booking
  		@tour_booking.update(tour_booking_params)
  	else
    	@tour_booking = @tour_package.tour_bookings.new(tour_booking_params)
  	end
    @tour_booking.user_id = current_user.id
    if @tour_booking.save
    	redirect_to tour_members_url(@tour_package.id)
    else
    	render "tour_booker"
    end
  end

  def tour_members
  	
  end

  def tour_member_create
  	@tour_booking.passengers.each do |p|
  		p.destroy
  	end
  	if params[:passenger][:name] and (params[:passenger][:name].size == (@tour_booking.number_of_people-1))
  		(@tour_booking.number_of_people-1).times do |i|
  			@tour_booking.passengers.create(name:params[:passenger][:name][i],age:params[:passenger][:age][i],gender:params[:passenger][:gender][i])
  		end
  		redirect_to tour_confirm_url(@tour_package.id)
  	else
  		render "tour_members"
  	end
  end

  def tour_confirm
  end

  def tour_confirm_done
  	if params[:confirmation] == "1"
  		@tour_booking.confirmation = true
  		@tour_booking.save
  		redirect_to @tour_package
  	else
  		render "tour_confirm"
  	end
  end

  private

  def find_tour_package
  	unless (@tour_package = TourPackage.find(params[:tour_package_id]))
  		redirect_to "/"
  	end
  end

  def tour_booking_params
	  params.require(:tour_booking).permit(:name, :contact, :address, :number_of_people)
  end

  def find_tour_booker_if_exist
  	@tour_booking = @tour_package.tour_bookings.find_by_user_id(current_user.id)
  end

  def check_if_already_booked
  	if @tour_package and find_tour_booker_if_exist and @tour_booking.confirmation
  		redirect_to @tour_package
  	end
  end

  def find_tour_booker
  	unless find_tour_booker_if_exist
  		redirect_to tour_booker_url(@tour_package.id)
  	end
  end
end

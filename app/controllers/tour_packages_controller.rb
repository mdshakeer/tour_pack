class TourPackagesController < ApplicationController
  before_action :set_tour_package, only: [:show, :edit, :update, :destroy]
  before_action :find_page, :only => [:search,:filter]
  before_action :collect_destinations, :only => [:index,:filter]

  # GET /tour_packages
  # GET /tour_packages.json
  def index
    @tour_packages = TourPackage.active.paginate(:page => params[:page])
  end

  def search
    @tour_packages = TourPackage.search_tour_pack(params[:q],params[:page])
    render "index"
  end

  def filter
    @tour_packages = TourPackage.filter_tour_pack(params[:source],params[:destination],params[:date],params[:page])
    render "index"
  end

  # GET /tour_packages/1
  # GET /tour_packages/1.json
  def show
  end

  # GET /tour_packages/new
  def new
    @tour_package = TourPackage.new
    respond_to do |format|
      format.js
    end
  end

  # GET /tour_packages/1/edit
  def edit
  end

  # POST /tour_packages
  # POST /tour_packages.json
  def create
    @tour_package = current_user.tour_packages.new(tour_package_params)

    respond_to do |format|
      if @tour_package.save
        if params[:name] and params[:name].any?
          params[:name].each_with_index do |name,i|
            @tour_package.destinations.create(name:name,point:params[:point][i],date:params[:date][i])
          end
        end
        format.html { redirect_to @tour_package, notice: 'Tour package was successfully created.' }
        format.json { render :show, status: :created, location: @tour_package }
      else
        format.html { render :new }
        format.json { render json: @tour_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_packages/1
  # PATCH/PUT /tour_packages/1.json
  def update
    respond_to do |format|
      if @tour_package.update(tour_package_params)
        if params[:name] and params[:name].any?
          @tour_package.destinations.delete_all
          params[:name].each_with_index do |name,i|
            @tour_package.destinations.create(name:name,point:params[:point][i],date:params[:date][i])
          end
        end
        format.html { redirect_to @tour_package, notice: 'Tour package was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_package }
      else
        format.html { render :edit }
        format.json { render json: @tour_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_packages/1
  # DELETE /tour_packages/1.json
  def destroy
    @tour_package.destroy
    respond_to do |format|
      format.html { redirect_to tour_packages_url, notice: 'Tour package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_package
      @tour_package = TourPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_package_params
      params.require(:tour_package).permit(:name, :age_from, :age_upto, :max_people, :cost_per_person, :last_submission_date, :active)
    end

    def collect_destinations
      @start_points = Destination.where(point:"Start").collect(&:name).uniq
      @end_points = Destination.where(point:"End").collect(&:name).uniq
      @start_dates = Destination.where(point:"Start").collect(&:date).uniq
    end
end

class RacesController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :except => [:index, :show]

  def index
    @races = Race.paginate(:page => params[:page])
    @title = "All races"
  end

  def show
    @race = Race.find(params[:id])
    @title = @race.name
  end

  def new
    @race  = Race.new
    @title = "Create race"
  end

  def create
    @race = Race.new(params[:race])
    if @race.save
      redirect_to @race, :flash => { :success => "Race created." }
    else
      @title = "Create race"
      render 'new'
    end
  end

  def edit
		@race = Race.find(params[:id])
		@title = "Edit race"
  end

  def update
		@race = Race.find(params[:id])
		@race.race_results.each do |rr|
			rr.attributes = params[:race_result][rr.id.to_s]
		end
		@race.race_results.each(&:save!)
    if @race.update_attributes(params[:race])
      redirect_to @race, :flash => { :success => "Race updated." }
    else
      @title = "Edit race"
      render 'edit'
    end
  end

	def sort
		@race = Race.find(params[:id])
		@race.race_results.each do |result|
		  result.place = params['race-results-list'].index(result.id.to_s) + 1
		  result.save
		end
		render :nothing => true
	end

  def destroy
		@race = Race.find(params[:id])
    @race.destroy
    redirect_to races_path, :flash => { :success => "Race destroyed." }
  end

	def init_relations
		@race = Race.find(params[:id])
		#RaceResult.init_race(@race)
		redirect_to @race
	end

	def init_results
		RaceResult.init_race(Race.find(params[:id]))
		redirect_to edit_race_path
	end

	def remove_result
		if !RaceResult.find(params[:result_id]).nil?
			@race_result = RaceResult.find(params[:result_id])
			@race_result.destroy
		end
		redirect_to edit_race_path
	end

	def remove_all_results
		@race = Race.find(params[:id])
		if !@race.race_results.empty?
			@race.race_results.each do |rr|
				rr.destroy
			end
		end
		redirect_to edit_race_path
	end

  private

    def admin_user
      redirect_to(root_path) if !current_user.admin?
    end
end

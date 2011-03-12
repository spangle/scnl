class DriversController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :except => [:index, :show]

  def index
    @drivers = Driver.paginate(:page => params[:page])
    @title = "All drivers"
  end

	def standings
		@standings = RaceResult.make_standings
		render 'standings'
	end

  def show
    @driver = Driver.find(params[:id])
    @title = @driver.name
  end

  def new
    @driver  = Driver.new
    @title = "Create driver"
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
      redirect_to @driver, :flash => { :success => "Driver created." }
    else
      @title = "Create driver"
      render 'new'
    end
  end

  def edit
		@driver = Driver.find(params[:id])
		@title = "Edit driver"
  end

  def update
		@driver = Driver.find(params[:id])
    if @driver.update_attributes(params[:driver])
      redirect_to @driver, :flash => { :success => "Driver updated." }
    else
      @title = "Edit driver"
      render 'edit'
    end
  end

  def destroy
		@driver = Driver.find(params[:id])
    @driver.destroy
    redirect_to drivers_path, :flash => { :success => "Driver destroyed." }
  end

  private

    def admin_user
      redirect_to(root_path) if !current_user.admin?
    end
end

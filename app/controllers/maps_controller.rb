class MapsController < ApplicationController
  before_action :map_params, only: [:create]

  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.gen_from_params(params)
    if @map.save
       redirect_to @map, notice: "Map was saved successfully."
     else
       flash[:error] = "Error creating map. Please try again."
       render :new
     end

    # if @map.save
    # #   @map
    # else
    #   flash[:notice] = "Failed to Parse CSV File"
    #   redirect_to :root
    # end
  end

  def show
    @map = Map.find(params[:id])
  end





  private
  def map_params
    params
      .require(:map)
      .permit(
        :name,
        :description,
        :point_collection,
        :trolls)
  end

end

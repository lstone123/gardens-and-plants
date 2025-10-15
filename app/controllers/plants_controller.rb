class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])
    @plant.garden = @garden
    # save the plant
    if @plant.save
      redirect_to garden_path(@garden) # if it saves redirect to the garden page
    else
      render "gardens/show", status: :unprocessable_entity  # if it doesn't save, need to render the form wiht the errors
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end

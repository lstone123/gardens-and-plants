class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params) # creating the plant using the plant hash inside the strong params
    @garden = Garden.find(params[:garden_id]) # find the garden asocciated with this plant using the id found in the url (FROM NESTED ROUTE!)
    @plant.garden = @garden # assigning the instance of garden found to the instance of plant
    if @plant.save # save the plant
      redirect_to garden_path(@garden) # if it saves redirect to the garden page
    else
      render "gardens/show", status: :unprocessable_entity  # if it doesn't save, need to render the form with the errors
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end

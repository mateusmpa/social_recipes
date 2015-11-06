class FoodTypesController < ApplicationController
  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(food_type_params)
    if @food_type.save
      redirect_to @food_type
    else
      render :new
    end
  end

  def show
    @food_type = FoodType.find(params[:id])
  end

  private

  def food_type_params
    params.require(:food_type).permit(:food_type_name)
  end
end

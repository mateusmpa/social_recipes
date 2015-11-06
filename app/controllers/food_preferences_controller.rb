class FoodPreferencesController < ApplicationController
  def new
    @food_preference = FoodPreference.new
  end

  def create
    @food_preference = FoodPreference.new(food_preference_params)
    if @food_preference.save
      redirect_to @food_preference
    else
      render :new
    end
  end

  def show
    @food_preference = FoodPreference.find(params[:id])
  end

  private

  def food_preference_params
    params.require(:food_preference).permit(:food_preference_name)
  end
end

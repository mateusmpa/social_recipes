class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:photograph, :recipe_name, :kitchen,
                                   :food_type, :food_preference, :amount_people,
                                   :cooking_time, :difficulty_level,
                                   :ingredients, :step_by_step)
  end
end

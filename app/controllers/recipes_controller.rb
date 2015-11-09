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

  def home
    @recipes = Recipe.order(created_at: :asc).last(20)
    @food_preferences = FoodPreference.all
  end

  def list_recipes_for_food_preference
    @recipes = Recipe.where(food_preference_id: params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:photograph, :kitchen_id, :recipe_name,
                                   :food_type_id, :food_preference_id,
                                   :amount_people, :cooking_time,
                                   :difficulty_level, :ingredients,
                                   :step_by_step)
  end
end

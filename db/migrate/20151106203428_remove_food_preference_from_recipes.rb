class RemoveFoodPreferenceFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :food_preference, :string
  end
end

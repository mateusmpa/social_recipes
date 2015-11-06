class RemoveFoodTypeFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :food_type, :string
  end
end

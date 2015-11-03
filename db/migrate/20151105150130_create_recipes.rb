class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :kitchen
      t.string :food_type
      t.string :food_preference
      t.integer :amount_people
      t.integer :cooking_time
      t.string :difficulty_level
      t.text :ingredients
      t.text :step_by_step

      t.timestamps null: false
    end
  end
end

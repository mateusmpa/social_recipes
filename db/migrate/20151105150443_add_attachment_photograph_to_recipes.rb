class AddAttachmentPhotographToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :photograph
    end
  end

  def self.down
    remove_attachment :recipes, :photograph
  end
end

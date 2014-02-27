class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :cook_time
      t.text   :ingredients
      t.text   :instructions
      t.string :picture
      
      t.timestamps
    end
  end
end

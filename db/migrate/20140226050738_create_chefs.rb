class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :specialty
      t.string :tv_show
      t.string :photo
      
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :profile_id

      t.timestamps
    end
    # Ensure Email Address Is Unique
    add_index :users, :email, unique: true
    add_index :users, :id
  end
end

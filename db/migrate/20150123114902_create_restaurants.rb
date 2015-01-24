class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :country
      t.string :address
      t.string :phone
      t.string :url
      t.string :email

      t.timestamps
    end
  end
end

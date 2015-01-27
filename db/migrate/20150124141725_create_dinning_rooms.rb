class CreateDinningRooms < ActiveRecord::Migration
  def change
    create_table :dinning_rooms do |t|
      t.string :name
      t.boolean :widget
      t.integer :priority

      t.timestamps
    end
  end
end

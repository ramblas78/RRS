class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :language, :string
  end
end

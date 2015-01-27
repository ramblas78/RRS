class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.integer :table
      t.string :comment
      t.string :ip_address
      t.integer :status
      t.string :source
      t.integer :type

      t.timestamps
    end
  end
end

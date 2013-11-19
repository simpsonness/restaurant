class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :table_id
      t.datetime :time

      t.timestamps
    end
  end
end

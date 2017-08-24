class CreateCommuteRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :commute_requests do |t|
      t.string :origin
      t.string :destination
      t.time :arrival_time
      t.string :email
      t.float :origin_latitude
      t.float :origin_longitude
      t.float :destination_latitude
      t.float :destination_longitude

      t.timestamps
    end
  end
end

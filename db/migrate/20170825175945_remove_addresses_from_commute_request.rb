class RemoveAddressesFromCommuteRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :commute_requests, :origin, :string
    remove_column :commute_requests, :destination, :string
    remove_column :commute_requests, :origin_latitude, :string
    remove_column :commute_requests, :origin_longitude, :string
    remove_column :commute_requests, :destination_latitude, :string
    remove_column :commute_requests, :destination_longitude, :string
  end
end

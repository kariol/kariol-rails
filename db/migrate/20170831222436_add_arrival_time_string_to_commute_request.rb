class AddArrivalTimeStringToCommuteRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :commute_requests, :arrival_time_string, :string
  end
end

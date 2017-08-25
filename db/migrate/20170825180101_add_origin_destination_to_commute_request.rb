class AddOriginDestinationToCommuteRequest < ActiveRecord::Migration[5.1]
  def change
    add_reference :commute_requests, :origin, foreign_key: { to_table: :addresses }
    add_reference :commute_requests, :destination, foreign_key: { to_table: :addresses }
  end
end

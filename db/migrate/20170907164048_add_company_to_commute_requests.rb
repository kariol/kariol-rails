class AddCompanyToCommuteRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :commute_requests, :company, :string
  end
end

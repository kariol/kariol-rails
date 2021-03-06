class CreateBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :business_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.string :employee_range
      t.references :address, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end

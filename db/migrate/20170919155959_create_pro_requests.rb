class CreateProRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :pro_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.text :message

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :complete
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

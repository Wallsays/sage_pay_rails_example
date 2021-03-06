class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string      :first_names, :null => false
      t.string      :surname,     :null => false
      t.string      :address_1,   :null => false
      t.string      :address_2
      t.string      :city,        :null => false
      t.string      :post_code,   :null => false
      t.references  :country,     :null => false
      t.string      :state
      t.string      :phone

      t.timestamps
    end

    change_table :payments do |t|
      t.references :billing_address, :null => false
      t.references :delivery_address
    end
  end

  def self.down
    change_table :payments do |t|
      t.remove :billing_address
      t.remove :delivery_address
    end
    drop_table :addresses
  end
end

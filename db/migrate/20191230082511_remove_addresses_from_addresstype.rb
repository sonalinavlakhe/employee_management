class RemoveAddressesFromAddresstype < ActiveRecord::Migration[5.2]
  def change
  	remove_column :addresstypes, :address_id
  end
end

class RemoveEmployeeFromAddressType < ActiveRecord::Migration[5.2]
  def change
  	remove_column :addresstypes, :employee_id
  end
end

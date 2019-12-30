class RemoveEmployeeFromDesignation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :designations, :employee_id
  end
end

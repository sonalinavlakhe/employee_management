class AddEmployeesToDesignation < ActiveRecord::Migration[5.2]
  def change
  	add_reference :employees, :designation
  end
end

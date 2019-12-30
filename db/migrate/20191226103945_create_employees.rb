class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :dob

      t.timestamps
    end
  end
end

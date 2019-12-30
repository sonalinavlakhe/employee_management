class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :Address_line_1
      t.string :Address_line_2
      t.string :Address_line_3
      t.string :city
      t.string :pin
      t.references :employee, foreign_key: true
      
      t.timestamps
    end
  end
end

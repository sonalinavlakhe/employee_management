class CreateAddresstypes < ActiveRecord::Migration[5.2]
  def change
    create_table :addresstypes do |t|
      t.string :name
      t.belongs_to :employee

      t.timestamps
    end
  end
end

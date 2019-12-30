class AddAddresstypeToAddress < ActiveRecord::Migration[5.2]
  def change
  	add_reference :addresses, :addresstype
  end
end

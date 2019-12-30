class AddresstypeToAddress < ActiveRecord::Migration[5.2]
  def change
  	add_reference :addresstypes, :address
  end
end

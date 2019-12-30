class AddCountryAndStateToAddress < ActiveRecord::Migration[5.2]
  def change
  	add_reference :addresses, :country
    add_reference :addresses, :state
  end
end

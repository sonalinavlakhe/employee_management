class EmployeeAddressSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :dob, :designation_details, :address_details
  def designation_details
  	{ designation_name: self.object.designation.name }
  end

  def address_details
  	self.object.addresses.map do |add|
  		{ Address_line_1: add.Address_line_1,
  		  Address_line_2: add.Address_line_2,
  		  Address_line_3: add.Address_line_3,
  		  city: add.city,
  		  pin: add.pin,
        addresstype: add.addresstype.name,
        state: add.state.name,
        country: add.country.name
  		}
  	end
  end
end
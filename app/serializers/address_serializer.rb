class AddressSerializer < ActiveModel::Serializer
  attributes :id, :Address_line_1, :Address_line_2, :Address_line_3, :city, :pin, :address_type_details, :employee_details, :state_details, :country_details

  def employee_details
  	{ Employee_id: self.object.employee.id,
  		Employee_name: self.object.employee.firstname }
  end

  def state_details
  	{ state_name: self.object.state.name }
  end

  def country_details
  	{ country_name: self.object.country.name }
  end
 
  def address_type_details
    { address_type: self.object.addresstype.name}
  end

end

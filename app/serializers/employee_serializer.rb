class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :dob, :designation_details
  def designation_details
  	{ designation_name: self.object.designation.name }
  end
end
class DesignationSerializer < ActiveModel::Serializer
  attributes :id, :name, :employees

  def employees
  	self.object.employees.map do |employee|
  		{ firstname: employee.firstname,
  		  lastname: employee.lastname,
  		  dob: employee.dob
  		}
  	end
  end

end

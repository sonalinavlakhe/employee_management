class EmployeesController < ApplicationController

	before_action :employee_find, only: [:show, :update, :destroy, :getEmployeeDetailsWithAddresses]

	#get  http://localhost:3000/employees
	def index
		@employee = Employee.all
		render json: @employee, status: :ok
	end

	#post  http://localhost:3000/employees
	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			render json: @employee, status: :ok
		else
			render json: { error: 'unbale to create Employee'} , status: 400
		end
	end

	#get  http://localhost:3000/employees/:id
	def show
		render json: @employee
	end

	#Get details of an employee (identified by employee ID) along with his/her addresses
	#get  http://localhost:3000/employees/getEmployeeDetailsWithAddresses?id=3
	def getEmployeeDetailsWithAddresses
		render json: @employee, serializer: EmployeeAddressSerializer
	end

	#get  http://localhost:3000/employees/4
	def update
		if @employee
			@employee.update(employee_params)
			render json: { message: 'Employee Updated Sucessfully'}, status: 200
		else
			render json: { error: 'unable to update Employee'}, status: 400
		end
	end

	#delete http://localhost:3000/employees/5
	def destroy
		if @employee
			@employee.destroy
			render json: { message: 'Employee Deleted Sucessfully'}, status: 200
		else
			render json: { error: 'unable to delete Employee'}, status: 400
		end
	end

	private

	def employee_params
		params.require(:employee).permit(:firstname, :lastname, :dob, :designation_id)
	end

	def employee_find
		@employee = Employee.find(params[:id])
	end
end

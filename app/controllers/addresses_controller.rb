class AddressesController < ApplicationController
	before_action :address_find, only: [:show, :update, :destroy]

	#get http://localhost:3000/addresses
	def index
		@address = Address.all	
		render json: @address, status: :ok
	end

	#post http://localhost:3000/addresses
	def create
		@address = Address.new(address_params)
		if @address.save
			render json: @address, status: :ok
		else
			render json: { error: 'unable to create Address'} , status: 400
		end
	end

	#get http://localhost:3000/addresses/3
	def show
		render json: @address
	end

	#put http://localhost:3000/addresses/3
	def update
		if @address
			@address.update(address_params)
			render json: { message: 'Address Updated Sucessfully'}, status: 200
		else
			render json: { error: 'unable to update Addresstype'}, status: 400
		end
	end

	#delete http://localhost:3000/addresses/3
	def destroy
		if @address
			@address.destroy
			render json: { message: 'Address Deleted Sucessfully'}, status: 200
		else
			render json: { error: 'unable to delete Address'}, status: 400
		end
	end

	#List addresses for a particular employee, identified by employee ID
	#get http://localhost:3000/addresses/getEmployeeAddress?employee_id=3
	def getEmployeeAddress
		@employee = Employee.find(params['employee_id'])
		render json: @employee.addresses
	end

	private

	def address_params
		params.require(:address).permit(:Address_line_1, :Address_line_2, :Address_line_3, :city, :pin, :employee_id, :country_id, :state_id, :addresstype_id)
	end

	def address_find
		@address = Address.find(params[:id])
	end
end

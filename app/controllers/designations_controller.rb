class DesignationsController < ApplicationController
	before_action :designation_find, only: [:show, :update, :destroy]

	#get http://localhost:3000/designations
	def index
		@designation = Designation.all
		render json: @designation, status: :ok
	end

	#post http://localhost:3000/designations
	def create
		@designation = Designation.new(designation_params)
		if @designation.save
			render json: @designation, status: :ok
		else
			render json: { error: 'Unable to create Designation' } , status: 400
		end
	end

	#get http://localhost:3000/designations/2
	def show
		render json: @designation
	end

	#put http://localhost:3000/designations
	def update
		if @designation
			@designation.update(designation_params)
			render json: { message: 'Designation Updated Sucessfully' }, status: 200
		else
			render json: { error: 'Unable to update Designation' }, status: 400
		end
	end

	#delete http://localhost:3000/designations
	def destroy
		if @designation
			@designation.destroy
			render json: { message: 'Designation Deleted Sucessfully' }, status: 200
		else
			render json: { error: 'unable to delete Employee' }, status: 400
		end
	end

	private

	def designation_params
		params.require(:designation).permit(:name)
	end

	def designation_find
		@designation = Designation.find(params[:id])
	end
end

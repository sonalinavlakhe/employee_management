class AddresstypesController < ApplicationController
	before_action :addresstype_find, only: [:show, :update, :destroy]

	#get http://localhost:3000/addresstypes
	def index
		@addresstype = Addresstype.all	
		render json: { addresstype: @addresstype.as_json(except: [:created_at, :updated_at])}, status: :ok
	end

	#post http://localhost:3000/addresstypes
	def create
		@addresstype = Addresstype.new(addresstype_params)
		if @addresstype.save
			render json: { addresstype: @addresstype.as_json(except: [:created_at, :updated_at])}, status: :ok
		else
			render json: { error: 'unable to create Addresstype'} , status: 400
		end
	end

	#get http://localhost:3000/addresstypes/2
	def show
		render json: { addresstype: @addresstype.as_json(except: [:created_at, :updated_at])}
	end

	#put http://localhost:3000/addresstypes/2
	def update
		if @addresstype
			@addresstype.update(addresstype_params)
			render json: { message: 'Addresstype Updated Sucessfully'}, status: 200
		else
			render json: { error: 'unable to update Addresstype'}, status: 400
		end
	end

	#delete http://localhost:3000/addresstypes/2
	def destroy
		if @addresstype
			@addresstype.destroy
			render json: { message: 'Addresstype Deleted Sucessfully'}, status: 200
		else
			render json: { error: 'unable to delete Addresstype'}, status: 400
		end
	end

	private

	def addresstype_params
		params.require(:addresstype).permit(:name)
	end

	def addresstype_find
		@addresstype = Addresstype.find(params[:id])
	end
end

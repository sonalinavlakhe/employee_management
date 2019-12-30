class CountriesController < ApplicationController
	before_action :country_find, only: [:show, :update, :destroy]

	#get http://localhost:3000/countries
	def index
		@country = Country.all	
		render json: @country, status: :ok
	end

	#post http://localhost:3000/countries
	def create
		@country = Country.new(country_params)
		if @country.save
			render json: @country, status: :ok
		else
			render json: { error: 'unable to create Country'} , status: 400
		end
	end

	#get http://localhost:3000/countries/1
	def show
		render json: @country
	end

	#put http://localhost:3000/countries/1
	def update
		if @country
			@country.update(country_params)
			render json: { message: 'Country Updated Sucessfully'}, status: 200
		else
			render json: { error: 'unable to update Country'}, status: 400
		end
	end

	#delete http://localhost:3000/countries/1
	def destroy
		if @country
			@country.destroy
			render json: { message: 'Country Deleted Sucessfully'}, status: 200
		else
			render json: { error: 'unable to delete Country'}, status: 400
		end
	end

	private

	def country_params
		params.require(:country).permit(:name)
	end

	def country_find
		@country = Country.find(params[:id])
	end
end

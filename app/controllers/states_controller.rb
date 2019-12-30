class StatesController < ApplicationController
	before_action :state_find, only: [:show, :update, :destroy]

	#get http://localhost:3000/states
	def index
		@state = State.all	
		render json: @state, status: :ok
	end

	#post http://localhost:3000/states
	def create
		@state = State.new(state_params)
		if @state.save
			render json: @state, status: :ok
		else
			render json: { error: 'unable to create State'} , status: 400
		end
	end

	#get http://localhost:3000/states/1
	def show
		render json: @state
	end

	#put http://localhost:3000/states/1
	def update
		if @state
			@state.update(state_params)
			render json: { message: 'State Updated Sucessfully'}, status: 200
		else
			render json: { error: 'unable to update State'}, status: 400
		end
	end

	#delete http://localhost:3000/states/2
	def destroy
		if @state
			@state.destroy
			render json: { message: 'State Deleted Sucessfully'}, status: 200
		else
			render json: { error: 'unable to delete State'}, status: 400
		end
	end

	private

	def state_params
		params.require(:state).permit(:name, :country_id)
	end

	def state_find
		@state = State.find(params[:id])
	end
end

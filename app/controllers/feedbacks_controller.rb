class FeedbacksController < ApplicationController

	def new
		@feedback = Feedback.new
		@feedback.slot
	end


	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.user_id = current_user.id
		@feedback.slot_id = params[:slot_id]

		respond_to do |format|
			if @feedback.save
				format.js{}
				format.html{}
				redirect_to slot_path(Slot.find(@feedback.slot_id))
			else
				@errors = @feedback.errors.full_messages
				format.js{}
				format.html{render :new, locals: {errors: @errors}}
			end
		end
	end

	def index
		@feedbacks = Feedback.all	
	end

	def show

	end




	private

	def feedback_params
		params.require(:feedback).permit(:rating, :comment)
	end


end
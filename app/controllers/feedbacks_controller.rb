class FeedbacksController < ApplicationController

	def new
		@feedback = Feedback.new
	end


	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.user_id = current_user.id

		if @feedback.valid?
			@feedback.save
			redirect_to '/feedbacks'
			else 
				@errors = @feedback.errors.full_messages
				render :new
		end
	end

	def index
		@feedbacks = Feedback.all	
	end




	private

	def feedback_params
		params.require(:feedback).permit(:rating, :comment)
	end


end
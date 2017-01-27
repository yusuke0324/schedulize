class FeedbacksController < ApplicationController

	def new
		@feedback = Feedback.new
	end


	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.user_id = current_user.id
		respond_to do |format|
			if @feedback.save
				format.js{}
				format.html{}
				redirect_to feedback_path(@feedback)
			else
				@errors = @feedback.errors.full_messages
				format.js{}
				format.html{render :new}
			end
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
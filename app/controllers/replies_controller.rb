class RepliesController < ApplicationController
  before_action :authenticate_user!

  #####this controller is for replying to topics

  def unproductive
  end

  def raise
  end

  def create
    @feeling = Feeling.find_by(id: reply_params[:feelings])
    @reply = Reply.new(
      user_id: current_user.id,
      feelings: @feeling.name,
      status: reply_params[:status],
      opinion: reply_params[:opinion],
      experience: reply_params[:experience],
      topic_id: reply_params[:topic_id]
    )
   @reply.save

  end

  def update
  end

  def destroy
  end

  private

  def reply_params
    params.require(:reply).permit(:feelings, :opinion, :experience, :status, :topic_id)
  end
end

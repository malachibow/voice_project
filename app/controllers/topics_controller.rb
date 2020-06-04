class TopicsController < ApplicationController
  before_action :authenticate_user!
  def show
    @reply = Reply.new
    @topic = Topic.find_by(id: params[:id])
    @replies = Reply.where(topic_id: @topic.id)
  end

  def list
    #holds a list of posts from the world
      if params[:page] == "following" 
          ######list for following
          @topics = Topic.all
      else 
           ######list for discover
           @topics = Topic.all
      end 
  end

  def new
  end

  def create
    @feeling = Feeling.find_by(id: topic_params[:feelings])
    ####### create the topic
    @topic = Topic.new(
      user_id: current_user.id,
      title: topic_params[:title],
      opinions: topic_params[:opinions],
      experience: topic_params[:experience],
      feelings: @feeling.name
    )
    if @topic.save
      redirect_to topics_path(topic: @topic.id), notice: "topic posted to the world."
    else
      redirect_to request.referrer, alert: "something went wrong. please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_id, :status, :feelings, :title, :opinions, :opinion, :experience)
  end

end

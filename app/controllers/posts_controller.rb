class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    #what is the definition of trending
    #show a list of topics with 3/4's of the posts trending and 1/4th not trending (pagnate)
    @posts = Post.all
  end

  def new
    #show a form to create a new post
  end

  def create
    #if the user has made new post in the last week that was not a reply post, dont let them post a new post
    #create the post
    @post = Post.new(
      title: post_params[:title],
      stand: post_params[:stand],
      why: post_params[:why],
      user_id: current_user.id
    )
    if @post.save
      redirect_to request.referrer, notice: "your voice was sent to the world."
    else
      redirect_to request.referrer, alert: "something went wrong. please try again."
    end

  end

  def update
    #allow the user to change his stand on his post (agree or disagree)
  end


  def show
    #show the post
    @post = Post.find_by(id: params[:id])

    #show the replies to the post
  end

  def post_params
    params.require(:post).permit(:title, :stand, :why, :reply_to, :agree, :change_stand)
  end
end

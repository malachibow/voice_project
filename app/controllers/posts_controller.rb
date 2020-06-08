class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    ##setting cache settings
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    ##
    if params[:filter] == "following"
      #following
      following_posts = Post.published.where(user_id: Follower.select("user_id").where(follower_id: current_user.id))
      @pagy, @posts = pagy(following_posts, items: 10)
    elsif params[:filter] == "replies"
      replies_to_my_posts = Post.where(reply_to: Post.select("id").where(user_id: current_user.id))
      @pagy, @posts = pagy(replies_to_my_posts, items: 10)
    else
      #what is the definition of trending
      #show a list of topics with 2/3's of the posts trending and 1/3rd not trending (pagnate)
      @posts = Post.original.published.random
    end
  end

  def unproductive
    #marking a post as unproductive
  end

  def new
    #show a form to create a new post
  end

  def saved
    #show a all saved posts
    @all_saved = Post.where(id: SavedPost.select('post_id').where(user_id: current_user.id))
  end

  def create
    #if the user has made new post in the last week that was not a reply post, dont let them post a new post
    if post_params[:reply_to].nil? 
      #check to make sure the last post made by this user longer than 1 week ago
      p = Post.where('created_at >= ?', Date.current.advance(days: -6))
      week_posts = p.find_by('user_id = ? AND original = ? AND publish = ?', current_user.id, true, true)
      if week_posts.nil?
        #create a new post
        @post = Post.new(
          title: post_params[:title],
          stand: post_params[:stand],
          user_id: current_user.id,
          publish: post_params[:publish],
          original: true
        )
        if @post.save
          if @post.publish?
            redirect_to request.referrer, notice: "your voice was sent to the world."
          else
            redirect_to request.referrer, notice: "your voice is saved in drafts."
          end 
        else
          redirect_to request.referrer, alert: "something went wrong. please try again."
        end
      else
                #create a new post and save it as unpublished
                @post = Post.new(
                  title: post_params[:title],
                  stand: post_params[:stand],
                  user_id: current_user.id,
                  publish: false,
                  original: true
                )
        if @post.save
          if post_params[:publish] == true
            redirect_to request.referrer, notice: "you've already made a new post for this week so this post was saved to your drafts for posting later. you can upgrade to premium to create more posts."
          else
            redirect_to request.referrer, notice: "your voice is saved in drafts."
          end 
        else
          redirect_to request.referrer, alert: "something went wrong. please try again."
        end
      end 
    else
      #check to make sure the user hasn't already replied to this post
      @user_posts = Post.find_by('user_id = ? AND reply_to = ?', current_user.id, post_params[:reply_to])
      if @user_posts.nil?
        #create a post reply
        @post = Post.new(
          reply_to: post_params[:reply_to],
          agree: post_params[:agree],
          stand: post_params[:stand],
          user_id: current_user.id,
          publish: post_params[:publish],
          original: false
        )
        if @post.save
          if post_params[:publish] == true
            redirect_to request.referrer, notice: "your voice was sent to the world."
          else
            redirect_to request.referrer, notice: "your voice is saved in drafts."
          end 
        else
          redirect_to request.referrer, alert: "something went wrong. please try again."
        end
      else
        redirect_to request.referrer, alert: "you've already posted in response to this post. once posted, your post cannot be edited."
      end 
    end 

  end

  def update
    #allow the user to change his stand on his post (agree or disagree)
    #allow the user the edit unpublished posts
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id && !@post.publish?
      if @post.publish == true && !Post.where('user_id = ? AND original = ? AND publish = ? AND created_at BETWEEN ? AND ?', current_user.id, true, true, (Date.current - 6), (Date.current)).nil?
        @post.update(post_params)
        @post.publish = false
        @post.save
        redirect_to request.referrer, alert: "You have already posted for this week. you can upgrade to premium if you would like to post more."
      else
        @post.update(post_params)
        redirect_to request.referrer, notice: "Saved..."
      end
    end
  end

  def save
    save_check = SavedPost.find_by(user_id: current_user.id, post_id: params[:id])
    
      if save_check.blank?
        @save = SavedPost.new(
          user_id: current_user.id,
          post_id: params[:id]
        )
        if @save.save
          redirect_to request.referrer, notice: "saved"
        else
          redirect_to request.referrer, notice: "something went wrong. try again."
        end 
      else
        save_check.destroy
        redirect_to request.referrer, notice: "unsaved"
      end
  end

  def show
    #show the post
    @post = Post.find_by(id: params[:id])

    #show the reactions to the post
    @reactions = Post.where(reply_to: params[:id])
  end

  def my_posts
    #show the replying posts
    if params[:page] == "my_reactions"
    @posts= Post.where(user_id: current_user.id, publish: true).where(original: false)
    elsif params[:page] == "drafts"
    #show the drafts
    @posts = Post.where(user_id: current_user.id, publish: false)
    else 
    #show the posts
    @posts = Post.where(user_id: current_user.id, publish: true)
    end
  end

  def follow 
    fol = Follower.find_by(follower_id: current_user.id, user_id: params[:id])
    if User.find_by(id: params[:id]) != current_user.id
      if fol.blank?
        @follower = Follower.new(
          user_id: params[:id],
          follower_id: current_user.id
        )
        if @follower.save
          redirect_to request.referrer, notice: "you are now following this voice."
        else
          redirect_to request.referrer, alert: "something went wrong. please try again."
        end
      else
        fol.destroy
        redirect_to request.referrer, notice: "you unfollowed this voice."
      end
    else
      redirect_to request.referrer, alert: "you cannot follow your self."
    end 
  end

  private

  def post_params
    params.require(:post).permit(:title, :stand, :reply_to, :publish, :agree, :change_stand)
  end
end

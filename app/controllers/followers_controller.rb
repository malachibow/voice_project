class FollowersController < ApplicationController
  def follow
    if !Follower.exists?(follower_id: current_user.id, user_id: params[:id])
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
      redirect_to request.referrer, notice: "you are already following this voice."
    end
  end

  def destroy
  end
end

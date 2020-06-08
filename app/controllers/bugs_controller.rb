class BugsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bugs = bug.all
  end

  def new
  end 

  def create
    @bug = Bug.new(
      content: bug_params[:content],
      user_id: current_user.id
    )
    if @bug.save
      redirect_to request.referrer, notice: "thank you for sharing. :)"
    else
      redirect_to request.referrer, alert: "something went wrong. please try again."
    end 
  end

  private
  def bug_params
    params.require(:bug).permit(:content)
  end
end

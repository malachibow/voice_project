class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to topics_list_path
    end
  end
end

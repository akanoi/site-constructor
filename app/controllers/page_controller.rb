class PageController < ApplicationController
  def home
    @page_title = "Home"
    @users = User.order(:points)
    @sites = Site.order(:rating)
  end
  
  def users
    @page_title = "Users"
    @users = User.all
  end
end

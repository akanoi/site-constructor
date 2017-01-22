class SingleController < ApplicationController
  def home
    @page_title = "Home"
    @users = User.order(:points)
    @sites_rating = Site.order(:rating)
    @sites = Site.order(:created_at)
  end
  
  def users
    @page_title = "Users"
    @users = User.all
  end

end

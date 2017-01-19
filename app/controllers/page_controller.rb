class PageController < ApplicationController
  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end

  def users
    @page_title = "Users"
    @users = User.all
  end
end

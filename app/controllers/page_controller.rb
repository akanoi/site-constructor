class PageController < ApplicationController
  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end
end

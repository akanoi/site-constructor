class SingleController < ApplicationController
  def home
    @page_title = "Home"
    @users = User.order(:points)
    @sites_rating = Site.order(:rating)
    @sites = Site.order(:created_at)
  end
  
  def users
    @page_title = "Users"
    @users = User.order(:points)
  end

  def sites
    @page_title = "Sites"
    @sites = Site.order(:rating)
  end

  def profile
    @page_title = "Profile"
    @user = User.find(params[:user_id])
    @sites = Site.order(params[:user_id]).order(:created_at)
  end


  def results
    @page_title = "Search Results"
    search = params[:s]
    @query_user = User.search do 
      fulltext search
    end 
    @query_site = Site.search do 
      fulltext search
    end 
    @query_page = Page.search do 
      fulltext search
    end 
    @result = @query_user.results + @query_page.results + @query_site.results
  end

  private
    def single_params
      params.permit(:user_id, :s)
    end
end
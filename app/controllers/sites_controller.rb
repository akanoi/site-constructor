class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:tag]
      @sites = Site.tagged_with(params[:tag])
    else
      @sites = Site.order(created_at: :desc)
    end
  end

  def show
    if params[:cur_page_id].nil?
      @current_page = @site.pages.first
    else
      @current_page = @site.pages.find(params[:cur_page_id])
    end
  end

  def new
    @page_title = "New Site"
    @user = User.find(params[:user_id])
    @site = @user.sites.new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @site = @user.sites.create(site_params)
    @user.sites.push(@site)
    respond_to do |format|
      if @site.save
        format.html { redirect_to new_user_site_page_path(@user.id, @site.id) }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url}
      format.json { head :no_content }
    end
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:title, :description, :menu, :user_id, :rating, :tag)
    end
end

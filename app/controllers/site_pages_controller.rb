class SitePagesController < ApplicationController
  before_action :set_site_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @site_pages = SitePage.all
    respond_with(@site_pages)
  end

  def show
    respond_with(@site_page)
  end

  def new
    @site = Site.find(params[:site_id])
    @site_page = @site.site_pages.new
    respond_with(@site_page)
  end

  def edit
    @site = Site.find(params[:site_id])
  end

  def create
    @site = Site.find(params[:site_id])
    @site_page = @site.site_pages.create(site_page_params)
    respond_to do |format|
      if @site_page.save
        format.html { redirect_to edit_user_site_page_path(current_user.id, @site.id, @site_page.id) }
        format.json { render :show, status: :created, location: @site_page }
      else
        format.html { render :new }
        format.json { render json: @site_page.errors, status: :unprocessable_entity }
      end
    end
    respond_with(@site_page)
  end

  def update
     respond_to do |format|
      if @site_page.update(site_page_params)
        format.html { redirect_to @site_page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_page }
      else
        format.html { render :edit }
        format.json { render json: @site_page.errors, status: :unprocessable_entity }
      end
    end
    respond_with(@site_page)
  end

  def destroy
    @site_page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
    respond_with(@site_page)
  end

  private
    def set_site_page
      @site_page = SitePage.find(params[:id])
    end

    def site_page_params
      params.require(:site_page).permit(:title, :pattren, :site, :body, :position)
    end
end

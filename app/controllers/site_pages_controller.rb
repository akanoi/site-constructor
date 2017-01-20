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
    @site_page = SitePage.new
    respond_with(@site_page)
  end

  def edit
  end

  def create
    @site_page = SitePage.new(site_page_params)
    @site_page.save
    respond_with(@site_page)
  end

  def update
    @site_page.update(site_page_params)
    respond_with(@site_page)
  end

  def destroy
    @site_page.destroy
    respond_with(@site_page)
  end

  private
    def set_site_page
      @site_page = SitePage.find(params[:id])
    end

    def site_page_params
      params[:site_page]
    end
end

class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pages = Page.all
  end

  def show
    @sites = Site.all
  end

  def new
    @site = Site.find(params[:site_id])
    @page = @site.pages.new
  end

  def edit
    @site = Site.find(params[:site_id])
  end

  def create
    @site = Site.find(params[:site_id])
    @page = @site.pages.create(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_user_site_page_path(current_user.id, @site.id, @page.id) }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :layout, :site_id, :body, :position)
    end
end

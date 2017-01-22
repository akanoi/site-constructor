class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @widgets = Widget.all
  end

  def show
  end

  def new
    @widget = Widget.new
  end

  def edit
  end

  def create
    @page = Page.find(params[:page_id])
    @widget = @page.widgets.create
    @widget.body = params[:anything][:body]
    @widget.position = params[:anything][:position]

    respond_to do |format|
      if @widget.save
        format.html { redirect_to user_site_path(current_user.id, params[:site_id]) }
        format.json { render :show, status: :created, location: @widget }
        format.js
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to @widget }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url, notice: 'Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_widget
      @widget = Widget.find(params[:id])
    end

    def widget_params
      params.permit(:page_id, :body, :position)
    end
end

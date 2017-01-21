class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @widgets = Widget.all
    respond_with(@widgets)
  end

  def show
    respond_with(@widget)
  end

  def new
    @widget = Widget.new
    respond_with(@widget)
  end

  def edit
  end

  def create
    @widget = Widget.new(widget_params)
    @widget.save
    respond_with(@widget)
  end

  def update
    @widget.update(widget_params)
    respond_with(@widget)
  end

  def destroy
    @widget.destroy
    respond_with(@widget)
  end

  private
    def set_widget
      @widget = Widget.find(params[:id])
    end

    def widget_params
      params[:widget]
    end
end

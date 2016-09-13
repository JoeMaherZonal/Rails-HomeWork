class ShowsController < ApplicationController

  respond_to :json

  def index
    render :json => Show.all
  end

  def create
    show = Show.create(show_params)
    render :json => show
  end

  def show
    render :json => Show.find(params[:id])
  end

  def update
    show = Show.find(params[:id])
    if show.update_attributes(show_params)
      render json: show, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    show = Show.find(params[:id])
    if show.destroy!
      render nothing: true
    else
      render status: :unprocessable_entity
    end
  end

  private
  def show_params
    params.require(:show).permit([:title, :series, :description, :image, :programmeID])
  end
end
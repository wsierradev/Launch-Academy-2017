class PaintingsController < ApplicationController
  def new
    @gallery = Gallery.find(params[:id])
    @painting = Painting.new
  end

  def create
  @gallery = Gallery.find(params[:gallery_id])
  @painting = Painting.new(painting_params)
  @painting.gallery =
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :artist)
end

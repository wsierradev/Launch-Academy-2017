class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

    def create
      @gallery = Gallery.new(gallery_params)

      if @gallery.save
        flash[:notice] = "Gallery added!!!"
        redirect_to gallery_path()
      else
        flash[:notice] = @gallery.errors.full_messages
        render :new
      end
    end

    def show
      @gallery = Gallery.find(params[:id])
    end

    private

    def gallery_params
      params.require(:gallery).permit(:name, :city, :state, :zipcode, :description)
    end

end

class AlbumsController < ApplicationController

    def show
      @album = Album.find(params[:id])
    end

    def index
      render :index
    end

    def edit
      @album = Album.find(params[:id])
      render :edit
    end

    def update
      @album = Album.find(params[:id])

      if @album.update(strong_params)
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
        redirect_to edit_album_url(@album)
      end
    end

    def new
      @album = Album.new(band_id: params[:band_id])
      render :new
    end

    def create
      @album = Album.new(strong_params)

      if @album.save
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
        render :new
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.delete
      redirect_to Albums_url
    end

    private

    def strong_params
      params.require(:album).permit(:title, :year, :studio, :band_id)
    end


end

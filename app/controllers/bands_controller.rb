class BandsController < ApplicationController

  def show
    @band = Band.find(params[:id])
  end

  def index
    render :index
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(strong_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to edit_band_url(@band)
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(strong_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end

  private

  def strong_params
    params.require(:band).permit(:name)
  end

end

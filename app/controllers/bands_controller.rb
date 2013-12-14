class BandsController < ApplicationController

  def index
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.create(params[:band])
    if !!@band
      @band.save!
      flash[:notices] = "Clear out the garage. It's jamming time!"
      redirect_to band_url(@band)
    else
      flash[:errors] = "You couldn't find a drummer. Sadface."
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params[:band])
      @band.save!
      flash[:notices] = "New bass player. Maybe he'll do less coke."
      redirect_to band_url(@band)
    else
      flash[:errors] = "Ringo never, Pete Best forever!"
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    flash[:notices] = "Nice one, Yoko, you just killed #{@band.name}."
    redirect_to new_band_url
  end

end
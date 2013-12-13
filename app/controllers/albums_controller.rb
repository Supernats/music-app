class AlbumsController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def show
    render :show
  end

  def create
    @album = Album.create(params[:album])
    if !!@album
      @album.save!
      flash[:notices] = "The #{album.name} master just came in! Bitchin!"
      redirect_to album_url(@album)
    else
      flash[:errors] = "You fried the board, bro! No bueno."
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes
      @album.save!
      flash[:notices] = "The new mix on track 1 is killer!"
      redirect_to album_url(@album)
    else
      flash[:errors] = "You can't mess with a masterpiece!"
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    flash[:notices] = "#{@album.name} is no more."
    redirect_to new_band_album_url(@album)
  end

end
class TracksController < ApplicationController

  def index
    @tracks = Track.where("tracks.album_id = ?", params[:album_id])
    render :index
  end

  def new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.create(params[:track])
    if !!@track
      @track.save!
      flash[:notices] = "Final mixing done on #{@track.name}."
      redirect_to track_url(@track)
    else
      flash[:errors] = "Uhh, it really fell apart in the bridge."
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      @track.save!
      flash[:notices] = "The new overdub in the second verse is killer!"
      redirect_to track_url(@track)
    else
      flash[:errors] = "Hey, maybe you should master the I-IV-V first."
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    flash[:notices] = "#{@track.name} didn't make the cut."
    redirect_to new_album_track(@track.album, @track)
  end

end

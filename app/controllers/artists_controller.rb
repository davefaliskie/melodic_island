class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @current_user = User.find(session[:user_id]) if session[:user_id]
    @current_artist = Artist.find_by(user_id: @current_user)
  end

  # GET /artists/new
  def new
    @artist = current_user.artists.new
  end

  # GET /artists/1/edit
  def edit
    @current_user = User.find(session[:user_id]) if session[:user_id]
    @current_artist = Artist.find_by(user_id: @current_user)

  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = current_user.artists.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @current_user, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @current_user, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :artist_type, :genre, :bio, :user_id, :cover_photo, :id)
    end
end

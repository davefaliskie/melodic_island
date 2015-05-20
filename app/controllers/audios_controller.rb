class AudiosController < ApplicationController
  before_action :require_user
  before_action :require_artist
  before_action :set_audio, only: [:show, :edit, :update, :destroy]

  # GET /audios
  # GET /audios.json
  def index
    @audio = Audio.all
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
    @audio = current_artist.audios.all
  end

  # GET /audios/new
  def new
    @audio = current_artist.audios.new
  end

  # GET /audios/1/edit
  def edit
  end

  # POST /audios
  # POST /audios.json
  def create
    @audio = current_artist.audios.new(audio_params)

    respond_to do |format|
      if @audio.save
        format.html { redirect_to artist_path(current_artist), notice: 'Your song was successfully uploaded.' }
        # format.json { render :show, status: :created, location: @audio }
      else
        format.html { render :new }
        # format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1
  # PATCH/PUT /audios/1.json
  def update
    # respond_to do |format|
    #   if @audio.update(audio_params)
    #     format.html { redirect_to @audio, notice: 'Audio was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @audio }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @audio.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio.destroy
    respond_to do |format|
      format.html { redirect_to artist_path(current_artist), notice: 'Your song was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

# *************REQUIRE ARTIST***************************************************************
    def current_artist
      @current_artist = Artist.find_by(user_id: current_user)
    end


    def require_artist
      if current_artist
          true
      else
          redirect_to register_path, notice: "You must have an artist page created."
      end
    end
# ****************************************************************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = current_artist.audios.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_params
      params.require(:audio).permit(:song)
    end
end

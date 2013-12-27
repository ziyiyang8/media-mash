class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy, :add]
  before_action :set_user

  before_filter :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = @user.albums
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  def add
    user_email = params[:user_email]
    user = User.find_by_email(user_email)
    if user.blank?
      redirect_to [@user, @album], flash: { error: "User #{user_email} not found"}
    else
      @album.users << user
      if @album.save
        redirect_to [@user, @album], notice: "Album shared to #{user_email}"
      #format.json { render action: 'show', status: :created, location: @album }
      else
        flash.now[:error] =  'Album failed to create'
      #format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /albums/new
  def new
    @album = Album.new

  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.users << @user

    if @album.save
      redirect_to [@user, @album], notice: 'Album was successfully created.'
      #format.json { render action: 'show', status: :created, location: @album }
    else
      flash.now[:error] =  'Album failed to create'
      render action: 'new'
      #format.json { render json: @album.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name)
    end
end

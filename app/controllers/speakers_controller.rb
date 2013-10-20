class SpeakersController < ApplicationController
  before_filter :store_location
  before_filter :authenticate_user!, only: [:update, :delete, :create, :new, :edit]
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]

  # GET /speakers
  # GET /speakers.json
  def index
    @speakers = Speaker.all
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show
    @speaker = Speaker.find(params[:id])
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  # POST /speakers.json
  def create
    @speaker = Speaker.new(speaker_params.merge({:user_id => current_user.id }))
    respond_to do |format|
      if @speaker.save
        format.html { redirect_to @speaker, notice: 'Speaker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @speaker }
      else
        format.html { render action: 'new' }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speakers/1
  # PATCH/PUT /speakers/1.json
  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
        format.html { redirect_to @speaker, notice: 'Speaker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker.destroy
    respond_to do |format|
      format.html { redirect_to speakers_url }
      format.json { head :no_content }
    end
  end

  def resources
  end

  def store_location
    if (!request.fullpath.match("/users/") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_update_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speaker_params
      params.require(:speaker).permit(:first_name, :last_name, :url, :slides, :past_talks, :location, :user_id, :expertise, :upcoming_talks)
    end

end

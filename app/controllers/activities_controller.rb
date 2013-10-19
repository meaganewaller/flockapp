class ActivitiesController < ApplicationController
  before_action :set_conference
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = @conference.activities
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = @conference.activities.build
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = @conference.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to [@conference, @activity], notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@conference, @activity] }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to [@conference, @activity], notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to conference_activities_url(@conference) }
      format.json { head :no_content }
    end
  end

  private
    def set_conference
      @conference = Conference.find(params[:conference_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = @conference.activities.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :description, :alcohol)
    end
end

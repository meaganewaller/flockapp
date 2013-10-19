class HotelsController < ApplicationController
  before_action :set_conference, only: [:show]
  before_action :set_hotel, only: [:show]

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels
  def new
    @hotel = Hotel.new
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.create(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'hotel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hotel }
      else
        format.html { render action: 'new' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def set_conference
    @conference = Conference.find_by_id(params[:conference_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
  #
  # Never trust parameters from the scary internet, only allow the white list through.
  def hotel_params
    params.require(:hotel).permit(:name, :location, :url)
  end
end


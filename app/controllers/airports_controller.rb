class AirportsController < ApplicationController
  before_action :set_conference, only: [:show]
  before_action :set_airport, only: [:show]

  # GET /airports/1
  # GET /airports/1.json
  def show
  end

  private
    def set_conference
      @conference = Conference.find_by_id(params[:conference_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_airport
      @airport = Airport.find(params[:id])
    end
end

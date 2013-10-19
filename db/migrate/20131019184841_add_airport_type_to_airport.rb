class AddAirportTypeToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :airport_type, :string
  end
end

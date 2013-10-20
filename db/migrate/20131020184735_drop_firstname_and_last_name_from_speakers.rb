class DropFirstnameAndLastNameFromSpeakers < ActiveRecord::Migration
  def change
    remove_column :speakers, :first_name, :string
    remove_column :speakers, :last_name, :string
    remove_column :speakers, :location, :string
  end
end

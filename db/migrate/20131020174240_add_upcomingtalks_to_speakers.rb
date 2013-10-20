class AddUpcomingtalksToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :upcoming_talks, :text
  end
end

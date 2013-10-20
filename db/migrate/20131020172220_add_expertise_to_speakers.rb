class AddExpertiseToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :expertise, :text
  end
end

class DropSpeakerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :speaker, :boolean
    remove_column :speakers, :user_id, :integer
    add_column :users, :speaker_id, :integer
  end
end

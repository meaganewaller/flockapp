class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name
      t.string :url
      t.string :slides
      t.text :past_talks
      t.string :location

      t.timestamps
    end
  end
end

class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :location
      t.string :url
      t.float :latitude
      t.float :longitude
      t.references :conference, index: true

      t.timestamps
    end
  end
end

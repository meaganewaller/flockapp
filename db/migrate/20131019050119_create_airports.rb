class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :code
      t.text :location
      t.references :conference, index: true

      t.timestamps
    end
  end
end

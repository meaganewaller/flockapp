class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :code
      t.string :name
      t.string :continent
      t.string :iso_country

      t.timestamps
    end
  end
end

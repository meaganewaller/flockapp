class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :category
      t.string :safety_policty
      t.boolean :childcare

      t.timestamps
    end
  end
end

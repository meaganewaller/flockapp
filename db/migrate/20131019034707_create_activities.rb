class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.boolean :alcohol
      t.references :conference

      t.timestamps
    end
  end
end

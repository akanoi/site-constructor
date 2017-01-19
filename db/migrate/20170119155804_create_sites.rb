class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user, null: false
      t.integer :rating
      t.string :tags
      t.datetime :create_time

      t.timestamps
    end
  end
end

class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.text :body
      t.integer :position
      t.integer :page
      
      t.timestamps
    end
  end
end

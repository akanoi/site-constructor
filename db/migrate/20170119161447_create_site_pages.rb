class CreateSitePages < ActiveRecord::Migration
  def change
    create_table :site_pages do |t|

      t.timestamps
    end
  end
end

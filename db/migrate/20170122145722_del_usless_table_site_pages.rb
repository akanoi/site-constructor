class DelUslessTableSitePages < ActiveRecord::Migration
  def change
    drop_table :site_pages
  end
end

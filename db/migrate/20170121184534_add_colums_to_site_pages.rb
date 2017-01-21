class AddColumsToSitePages < ActiveRecord::Migration
  def change
    add_column :site_pages, :title, :string
    add_column :site_pages, :site, :integer
    add_column :site_pages, :pattern, :string
  end
end

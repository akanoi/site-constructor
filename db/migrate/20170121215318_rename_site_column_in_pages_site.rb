class RenameSiteColumnInPagesSite < ActiveRecord::Migration
  def change
    change_table :site_pages do |t|
      t.rename :site, :site_id
    end
  end
end

class AddMenuTypeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :menu, :string
  end
end

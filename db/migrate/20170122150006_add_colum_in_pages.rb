class AddColumInPages < ActiveRecord::Migration
  def change
    add_column :pages, :title, :string
    add_column :pages, :site_id, :integer
    add_column :pages, :layout, :string
  end
end

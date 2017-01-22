class RenameUserColumnInSites < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.rename :user, :user_id
    end
  end
end

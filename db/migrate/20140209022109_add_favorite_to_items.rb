class AddFavoriteToItems < ActiveRecord::Migration
  def change
    add_column :items, :favorite, :integer, :limit => 1
  end
end

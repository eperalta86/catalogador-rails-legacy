class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at
      t.integer :item_id

      t.references :item, index: true

      t.timestamps
    end
  end
end
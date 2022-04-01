class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :mycomment
      t.references :item, index: true

      t.timestamps
    end
  end
end

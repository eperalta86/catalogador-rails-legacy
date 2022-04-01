class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.integer :dvd
      t.integer :dvd2
      t.text :filename
      t.text :system
      t.text :recorded
      t.integer :copies
      
      t.timestamps
    end
  end
end

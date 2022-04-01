class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :sysname

      t.timestamps
    end
  end
end

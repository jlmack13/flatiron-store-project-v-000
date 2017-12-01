class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.integer :inventory
      t.belongs_to :category, index: true
    end
  end
end

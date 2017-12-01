class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total
      t.belongs_to :user, index: true
      t.belongs_to :cart, index: true
    end
  end
end

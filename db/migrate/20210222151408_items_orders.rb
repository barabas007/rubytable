class ItemsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :items_orders, id: false do |t|
      t.belongs_to :item 
      t.belongs_to :order 

      #t.integer :item_id
      #t.integer :order_id
    end
  end
end

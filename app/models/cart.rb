class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  #can calculate its total
  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  #add_item
  def add_item(item_id)
    #creates a new unsaved line_item for new item
    #creates an appropriate line_item
    #updates existing line_item instead of making new when adding same item
    new_item = self.line_items.find_by(item_id: item_id)
    if new_item
      new_item.quantity += 1
      new_item.save
    else
      new_item = self.line_items.build(item_id: item_id)
    end
    new_item
  end

  #checkout
  def checkout
    self.update(status: "submitted")
    self.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end
  end

end

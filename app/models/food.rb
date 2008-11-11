class Food < ActiveRecord::Base
  has_many :food_items, :dependent => :destroy
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :cost, :on => :create, :message => "can't be blank. (Enter 0 if necessary)"
  def new_food_item_attributes=(child_attributes)
    child_attributes.each do |attributes|
      food_items.build(attributes)
    end
  end  
  
  def get_count(size)
    cur = 0
    for item in food_items
      if size >= item.lower
        if item.upper
          if size <= item.upper
            cur = item.quantity
          end
        else
          cur = item.quantity
        end
      end
    end
    return cur
  end
end

module FoodsHelper
  def add_food_item_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, 'food_items', :partial => 'food_item', :object => FoodItem.new
    end
  end
end

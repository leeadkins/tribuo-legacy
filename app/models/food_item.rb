class FoodItem < ActiveRecord::Base
  belongs_to :food
  validates_presence_of :quantity, :on => :create, :message => "can't be blank"
  validates_presence_of :lower, :on => :create, :message => "can't be blank"
end

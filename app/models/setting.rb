class Setting < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :value, :on => :create, :message => "can't be blank"
  
end

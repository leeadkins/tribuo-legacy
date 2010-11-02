class Child < ActiveRecord::Base
  belongs_to :family, :counter_cache => true
   
end

class Family < ActiveRecord::Base
  has_many :children, :dependent => :destroy
  default_scope order("lastname ASC, firstname ASC")
  cattr_reader :per_page
  @@per_page = 15
  
  accepts_nested_attributes_for :children, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }
  
end

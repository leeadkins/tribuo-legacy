class Family < ActiveRecord::Base
  has_many :children, :dependent => :destroy
  default_scope order("lastname ASC, firstname ASC")
  
  def self.per_page
    15
  end
  
  
  accepts_nested_attributes_for :children, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }
  
  #More Scopes... Easier for searching.
  scope :flagged, where(:flag => true)
  scope :food_only, where(:foodonly => true)
  
  def self.filter_by_params(params)
    scope = scoped
    scope = scope.flagged if params[:flagged] == "true" unless params[:flagged].blank?
    scope = scope.food_only if params[:foodonly] == "true" unless params[:foodonly].blank?
    scope
  end
end

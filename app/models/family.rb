class Family < ActiveRecord::Base
  belongs_to :user
  has_many :children, :dependent => :destroy
  
  validates_presence_of :firstname, :on => :create, :message => "can't be blank"  
  validates_presence_of :lastname, :on => :create, :message => "can't be blank"
  #validates_presence_of :address, :on => :create, :message => "can't be blank"
  #validates_presence_of :phone, :on => :create, :message => "can't be blank"
  validates_numericality_of :familysize, :on => :create, :message => "is not a number"
  validates_numericality_of :childrensize, :on => :create, :message => "is not a number"
  validates_presence_of :familysize, :on => :create, :message => "can't be blank"
  validates_presence_of :childrensize, :on => :create, :message => "can't be blank"
  validates_presence_of :foodonly, :on => :create, :message => "can't be blank"
  
  def new_child_attributes=(child_attributes)
    child_attributes.each do |attributes|
      children.build(attributes)
    end
  end
  
  def human_foodonly
    if (foodonly == 0)
      return "No"
    else
      return "Yes"
    end
  end
  
  def human_pickup
    if (pickup == 0)
      return "Pickup"
    else
      return "Delivery"
    end
  end
end

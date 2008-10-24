class Child < ActiveRecord::Base
  belongs_to :family, :counter_cache => true
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_numericality_of :age, :on => :create, :message => "is not a number"
  validates_presence_of :age, :on => :create, :message => "can't be blank"
  validates_presence_of :agetype, :on => :create, :message => "can't be blank"
  validates_presence_of :gender, :on => :create, :message => "can't be blank"
  
  def human_gender
    if (self.gender == 0)
      return "Boy"
    else
      return "Girl"
    end
  end
  
  def human_type
    if (self.agetype == 0)
      if (self.age > 1)
        return "Years"
      else
        return "Year"
      end
    else
      if (self.age > 1)
        return "Months"
      else
        return "Month"
      end
    end
  end
end

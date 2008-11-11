class ShoppinglistController < ApplicationController
  before_filter :login_required
  def index
  end

  def food
    @food = Food.find(:all, :include => :food_items)
    @families = Family.find(:all)
    @foodcounts = Hash.new
    for fd in @food
      @foodcounts[fd] = Hash.new
      @foodcounts[fd][:quantity] = 0
      for fam in @families
        @foodcounts[fd][:quantity] += fd.get_count(fam.familysize)
      end
      @foodcounts[fd][:cost] = @foodcounts[fd][:quantity] * fd.cost
    end
  end

  def toys
  end

end

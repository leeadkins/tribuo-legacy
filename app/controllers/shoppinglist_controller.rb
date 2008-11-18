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
      @foodcounts[fd][:quanextra] = 0
      @foodcounts[fd][:costextra] = 0
      for fam in @families
        @foodcounts[fd][:quantity] += fd.get_count(fam.familysize)
      end
      @foodcounts[fd][:quanextra] = fd.get_count(4) * @EXTRA_BOXES
      @foodcounts[fd][:quanextra] += @foodcounts[fd][:quantity]
      @foodcounts[fd][:costextra] = @foodcounts[fd][:quanextra] * fd.cost
      @foodcounts[fd][:cost] = @foodcounts[fd][:quantity] * fd.cost
    end
  end
  
  def children
    params[:age] == nil ? @ageparam = "%" : @ageparam = "#{params[:age]}"
    params[:agetype] == nil ? @typeparam = "%" : @typeparam = "#{params[:agetype]}"
    params[:gender] == nil ? @genparam = "%" : @genparam = "#{params[:gender]}"
    @children = Child.find(:all, :conditions => ["age LIKE ? AND agetype LIKE ? AND gender LIKE ?", "#{@ageparam}", "#{@typeparam}", "#{@genparam}"])
  end

  def toys
    @children = Child.find(:all)
    @girlarray = Array.new
    @boyarray = Array.new
    @girltotal = 0
    @boytotal = 0
    for child in @children
      if child.gender == 0
        if child.agetype == 0
          @boyarray[child.age] != nil ?  @boyarray[child.age] += 1 : @boyarray[child.age] = 1
        else
          @boyarray[0] != nil ? @boyarray[0] += 1: @boyarray[0] = 1
        end
        @boytotal += 1
      else
        if child.agetype == 0
          @girlarray[child.age] != nil ? @girlarray[child.age] += 1 : @girlarray[child.age] = 1
        else
          @girlarray[0] != nil ? @girlarray[0] += 1 : @girlarray[0] = 1
        end
        @girltotal += 1
      end
    
      
      if @boyarray.size >= @girlarray.size
        @colsize = @boyarray.size
      else
        @colsize = @girlarray.size
      end
      
      #Now, let's loop through each and normalize them.
      #We'll use the largest and find all the nil values.
      
     for i in 0..@colsize-1
        if @boyarray[i] == nil
          @boyarray[i] = 0
        end
       if @girlarray[i] == nil
          @girlarray[i] = 0
       end
      end
    end
  end

end

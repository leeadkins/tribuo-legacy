class FoodItemsController < ApplicationController
  before_filter :login_required, :load_food
  def load_food
    @food = Food.find(params[:food_id])
  end
  # GET /food_items
  # GET /food_items.xml
  def index
    @food_items = @food.food_items.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @food_items }
    end
  end

  # GET /food_items/1
  # GET /food_items/1.xml
  def show
    @food_item = @food.food_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @food_item }
    end
  end

  # GET /food_items/new
  # GET /food_items/new.xml
  def new
    @food_item = @food.food_items.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @food_item }
    end
  end

  # GET /food_items/1/edit
  def edit
    @food_item = @food.food_items.find(params[:id])
  end

  # POST /food_items
  # POST /food_items.xml
  def create
    @food_item = @food.food_items.new(params[:food_item])

    respond_to do |format|
      if @food_item.save
        flash[:notice] = 'FoodItem was successfully created.'
        format.html { redirect_to(@food) }
        format.xml  { render :xml => @food_item, :status => :created, :location => @food_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @food_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /food_items/1
  # PUT /food_items/1.xml
  def update
    @food_item = @food.food_items.find(params[:id])

    respond_to do |format|
      if @food_item.update_attributes(params[:food_item])
        flash[:notice] = 'FoodItem was successfully updated.'
        format.html { redirect_to(@food) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @food_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.xml
  def destroy
    @food_item = @food.food_items.find(params[:id])
    @food_item.destroy

    respond_to do |format|
      format.html { redirect_to(food_food_items_url(@food)) }
      format.xml  { head :ok }
    end
  end
end

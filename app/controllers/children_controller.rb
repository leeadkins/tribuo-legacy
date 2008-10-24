class ChildrenController < ApplicationController
  before_filter :login_required, :load_family
  skip_before_filter :verify_authenticity_token
  def load_family
    @family = Family.find(params[:family_id])
  end
  # GET /children
  # GET /children.xml
  def index
    @children = @family.children.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /children/1
  # GET /children/1.xml
  def show
    @child = @family.children.find(params[:id], :include => :family)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @child.to_xml(:include => :family) }
    end
  end

  # GET /children/new
  # GET /children/new.xml
  def new
    @child = @family.children.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @child }
    end
  end

  # GET /children/1/edit
  def edit
    @child = @family.children.find(params[:id])
  end

  # POST /children
  # POST /children.xml
  def create
    @child = @family.children.new(params[:child])

    respond_to do |format|
      if @child.save
        flash[:notice] = 'Child was successfully created.'
        format.html { redirect_to(@family) }
        format.xml  { render :xml => @child, :status => :created, :location => @child }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /children/1
  # PUT /children/1.xml
  def update
    @child = @family.children.find(params[:id])

    respond_to do |format|
      if @child.update_attributes(params[:child])
        flash[:notice] = 'Child was successfully updated.'
        format.html { redirect_to(@family) }
        format.xml  { head :ok }
        format.json { render :json => @child}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
        format.json { render :json => @child, :status => :unprocessable_entity}
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.xml
  def destroy
    @child = @family.children.find(params[:id])
    @child.destroy

    respond_to do |format|
      format.html { redirect_to(family_children_url(@family)) }
      format.xml  { head :ok }
    end
  end
end

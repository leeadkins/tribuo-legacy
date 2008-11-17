class ChildrenController < ApplicationController
  before_filter :login_required
  before_filter :load_family, :except => 'index'
  skip_before_filter :verify_authenticity_token
  def load_family
    @family = Family.find(params[:family_id])
  end
  # GET /children
  # GET /children.xml
  def index
    if request.format.html?
      @family = Family.find(params[:family_id])
      @children = @family.children.find(:all)
    else
      @children = Child.find(:all)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children }
      format.pdf {send_data gen_pdf, :filename => "toytickets.pdf", :type => "application/pdf"}
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
      flash[:notice] = 'Child removed.'
      format.html { redirect_to(family_url(@family)) }
      format.xml  { head :ok }
    end
  end
  private
   def gen_pdf
     sd = "MARION COUNTY SHERIFF'S DEPARTMENT"
     pdf=FPDF.new('p','mm','letter')
     pdf.SetLineWidth(2)
     pdf.AddPage
     @switcher = 1;
     @families = Family.find(:all, :order => 'box ASC')
     for family in @families
       curbag = 0
       if family.box == nil
         boxy = "?"
       else
         boxy = family.box.to_s
       end
        for kidy in family.children
          curbag = curbag + 1
          if kidy.agetype == 0
           rest = ""
         else
           rest = "m"
         end
          
          if kidy.gender == 0
            gend = "B / " + kidy.age.to_s + rest
          else
            gend = "G / " + kidy.age.to_s + rest
          end
          
          
          if @switcher == 1
            pdf.SetFont('Arial','B',16)
            pdf.TextCenter(10,sd)
            pdf.SetFont('Arial','',30)
            pdf.TextRight(30,gend)
            pdf.SetFont('Arial','',60)
            pdf.TextCenter(40,kidy.name.capitalize)
            pdf.SetFont('Arial','',20)
            pdf.TextCenter(55,("Parent: " + family.firstname.capitalize + " " + family.lastname.capitalize))
            pdf.SetFont('Arial','BI', 115)
            pdf.TextCenter(95,boxy)
            pdf.SetFont('Arial','',30)
            pdf.TextRight(130,"Sack " + curbag.to_s + " of " + family.children.size.to_s)
            pdf.Image('public/images/gift.jpg',10,100,40)
            @switcher = 2
          else
            pdf.SetFont('Arial', 'B', 16)       
            pdf.TextCenter(150,sd)
            pdf.SetFont('Arial', '', 30)
            pdf.TextRight(170, gend)
            pdf.SetFont('Arial','',60)
            pdf.TextCenter(180,(kidy.name.capitalize))
            pdf.SetFont('Arial','',20)
            pdf.TextCenter(195,("Parent:  " + family.firstname.capitalize + " " + family.lastname.capitalize))
            pdf.SetFont('Arial','BI', 115)
            pdf.TextCenter(245,boxy)
            pdf.SetFont('Arial','',30)
            pdf.TextRight(270,"Sack " + curbag.to_s + " of " + family.children.size.to_s)
            pdf.Image('public/images/gift.jpg',10,240,40)
            pdf.Line(0,140,215,140)
            pdf.AddPage
            @switcher = 1
          end
        end
     end
     pdf.Output
   end
end

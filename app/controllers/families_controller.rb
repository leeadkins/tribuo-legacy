class FamiliesController < ApplicationController
  before_filter :login_required
  skip_before_filter :verify_authenticity_token
  # GET /families
  # GET /families.xml
  def index
    @families = Family.find(:all, :order => "lastname ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @families }
      format.pdf { send_data gen_pdf, :filename => "foodtickets.pdf", :type => "application/pdf"}
    end
  end

  # GET /families/1
  # GET /families/1.xml
  def show
    @family = Family.find(params[:id], :include => :children)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @family.to_xml(:include => :children) }
    end
  end

  # GET /families/new
  # GET /families/new.xml
  def new
    @family = Family.new
    @family.pickup = 0
    @family.children.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @family }
    end
  end

  # GET /families/1/edit
  def edit
    @family = Family.find(params[:id])
  end

  # POST /families
  # POST /families.xml
  def create
    @family = Family.new(params[:family])
    @family.user_id = current_user.id 
    respond_to do |format|
      if @family.save
        flash[:notice] = 'Family was successfully created.'
        format.html { redirect_to(@family) }
        format.xml  { render :xml => @family, :status => :created, :location => @family }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /families/1
  # PUT /families/1.xml
  def update
    @family = Family.find(params[:id])

    respond_to do |format|
      if @family.update_attributes(params[:family])
        flash[:notice] = 'Family was successfully updated.'
        format.html { redirect_to(@family) }
        format.xml  { head :ok }
        format.json { render :json => @family }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
        format.json { render :json => @family, :status => :unprocessable_entity}
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.xml
  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to(families_url) }
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
       # Some quick processing the aid in the generation of these box labels
       if family.box == nil
         boxy = "?"
       else
         boxy = family.box.to_s
       end
       if family.children.size == 0
         toys = "No"
       else
         toys = family.children.size.to_s
       end
       #That's all...
       if @switcher == 1
         pdf.SetFont('Arial','B',16)
         pdf.TextCenter(10,sd)
         pdf.SetFont('Arial','',30)
         pdf.TextRight(30,"Size : " + family.familysize.to_s)
         pdf.SetFont('Arial','',20)  
         pdf.TextLeft(40,"Name:    " + family.firstname.capitalize + " " + family.lastname.capitalize)
         pdf.TextLeft(50,"Address: " + family.address)
         pdf.TextLeft(60,"Phone:   " + family.phone)
         pdf.SetFont('Arial','BI', 115)
         pdf.TextCenter(100,boxy)
         pdf.SetFont('Arial','',30)
         pdf.TextRight(110,"Toys: " + toys)
         @switcher = 2
       else
         pdf.SetFont('Arial', 'B', 16)       
         pdf.TextCenter(150,sd)
         pdf.SetFont('Arial', '', 30)
         pdf.TextRight(170,"Size : "+ family.familysize.to_s)
         pdf.SetFont('Arial','',20)
         pdf.TextLeft(180,"Name:    " + family.firstname.capitalize + " " + family.lastname.capitalize)
         pdf.TextLeft(190,"Address: " + family.address)
         pdf.TextLeft(200,"Phone:   " + family.phone)
         pdf.SetFont('Arial','BI', 115)
         pdf.TextCenter(240,boxy)
         pdf.SetFont('Arial','',30)
         pdf.TextRight(250, "Toys: " + toys)
         pdf.Line(0,140,215,140)
         pdf.AddPage
         @switcher = 1
       end
     end
     pdf.Output
   end
end

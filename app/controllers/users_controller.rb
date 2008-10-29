class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #(by Lee: Done! Thanks Rick!)
  # render new.rhtml
  before_filter :login_required, :except => [:new, :create]
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def edit
    unless Role.find(User.find(current_user.id).role).admin == "1"
      if (current_user.id != params[:id])
        flash[:notice] = "#{current_user.id} You do not have permission to edit this user. #{params[:id]}"
        redirect_to :controller => "families", :action => "index"
      else
        @user = User.find(params[:id])
      end
    end
  end
  
  def update
    def update
      unless Role.find(User.find(current_user.id).role).admin == "1"
        if (current_user.id != params[:id])
          flash[:notice] = "You do not have permission to edit this user."
          redirect_to :controller => "families", :action => "index"
        else
          @user = User.find(params[:id])
        end
      end
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'User was successfully updated.'
          format.html { redirect_to(@user) }
          format.xml  { head :ok }
          format.json { render :json => @user }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          format.json { render :json => @user, :status => :unprocessable_entity}
        end
      end
    end
  end
  
  def show
    
  end
end

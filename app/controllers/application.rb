# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  before_filter :load_global_settings
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ea8331945316b5217ff6323e230c987e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  private
  def load_global_settings
    @IS_MAINTENANCE_MODE = Setting.find_by_name("maintenance").value
    if Setting.find_by_name("extraboxes")
      @EXTRA_BOXES = Setting.find_by_name("extraboxes").value.to_i
    else
      @EXTRA_BOXES = 40
    end
  end
end

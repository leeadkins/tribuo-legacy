class JavascriptsController < ApplicationController
before_filter :login_required
def flag_family
  if request.put?   #after all, we *are* updating...
    @family = Family.find(params[:id])
    if (params[:flag] == "true")
      if (@family.flag == nil || @family.flag == false)
        @family.flag = true
        @listcolor = '#89c2ea'
        @flagimage = "../../images/StarIconGold.png"
      else
        @family.flag = false
        @listcolor = "white"
        @flagimage = "../../images/StarIconSilver.png"
      end
    end
    respond_to do |format|
      if @family.save
        format.js
      else
        format.js
      end
    end
  else
    render :text => 'Forbidden'
  end
end

end

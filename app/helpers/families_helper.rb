module FamiliesHelper
   def add_child_link(name)
     link_to_function name do |page|
       page.insert_html :bottom, 'children', :partial => 'child', :object => Child.new
     end
   end
   
end

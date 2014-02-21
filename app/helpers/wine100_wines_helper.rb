module Wine100WinesHelper
	def link_to_remove_fields(name, f)
		
		name = "<span class=\"add-on\"><i class=\"icon-remove\">#{name}</i></span>"
	  f.hidden_field(:_destroy) + link_to_function(name.html_safe, "remove_fields(this)")
	end

	def link_to_add_fields(name, f, association, outer_class)
	  new_object = f.object.class.reflect_on_association(association).klass.new
	  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|

	    render(association.to_s.singularize + "_fields", :f => builder)
	  end
	  name = "<span class=\"add-on\"><i class=\"icon-plus\">#{name}</i></span>"
	  link_to_function(name.html_safe, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{outer_class}\")")
	end
end

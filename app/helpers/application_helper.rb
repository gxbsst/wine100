# encoding: utf-8
module ApplicationHelper

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

  #def wine_group_wine_group_items_path(wine_group)
  #  "/refinery/wine_groups/#{wine_group.id}/wine_group_items"
  #end
  #
  #def post_wine_to_item_path
  #  "/refinery/wine_groups/wine_group_items"
  #end

  def wine_check_box(wine, group_id)
    if group_id.present?
      group = Refinery::WineGroups::WineGroup.find(group_id)
      wine_ids = group.wine_group_items.collect(&:wine_id)
      #check_box_tag 'wine_ids[]', wine.id, (wine_ids.include? wine.id) ? true : false
      check_box_tag 'wine_ids[]', wine.id, false
    else
      check_box_tag 'wine_ids[]', wine.id, false
    end
  end

  def user_check_box(member, group_id)
    if group_id.present?
      group = Refinery::UserGroups::UserGroup.find(group_id)
      member_ids = group.items.collect(&:refinery_member_id)
      #check_box_tag 'member_ids[]', member.id, (member_ids.include? member.id) ? true : false
      check_box_tag 'member_ids[]', member.id, false
    else
      check_box_tag 'member_ids[]', member.id, false
    end
  end

  def select_wine_group(group_id)
    select_tag(:group_id,
               options_from_collection_for_select(wine_group_all, "id", "name",:selected => group_id ? group_id : nil),
               :prompt => "请选择要加入的酒组")

  end

  def select_user_group(group_id)
    select_tag(:group_id, 
               options_from_collection_for_select(user_group_all, "id", "name",:selected => group_id ? group_id : nil),
               :prompt => "请选择要加入的用户组")

  end

  def wine_group_all
    Refinery::WineGroups::WineGroup.all
  end

  def user_group_all
    Refinery::UserGroups::UserGroup.all
  end

  def c_path(test_paper)
    if test_paper.new_record?
      challenges_path
    else
      challenge_path(test_paper)
    end
  end

  def export_path(wine_id)
  "/refinery/test_papers/#{wine_id}/export"
  end

  def export_group_path(group_id)
  "/refinery/test_papers/#{group_id}/export_for_group"
  end

  def export_wine_group_path(wine_group_id)
    "/refinery/test_papers/#{wine_group_id}/export_for_wine_group"
  end

  def export_all_path
    "/refinery/test_papers/export_all"
  end

  def export_all_wines_path
    "/refinery/wine100_wines/export_all"
  end

  def export_all_users_path
    "/refinery/wine100_profiles/export_all"
  end
end

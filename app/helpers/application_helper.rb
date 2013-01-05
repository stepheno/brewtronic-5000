module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    arrow_icon = "<i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>"
    title_arrow = (column == sort_column && !params[:sort].nil?) ? title + arrow_icon : title
    link_to title_arrow.html_safe, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end

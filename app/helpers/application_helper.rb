module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    arrow_icon = "<i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>"
    title_arrow = (column == sort_column && !params[:sort].nil?) ? title + arrow_icon : title
    link_to title_arrow.html_safe, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end

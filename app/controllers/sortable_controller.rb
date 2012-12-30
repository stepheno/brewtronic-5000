module SortableController

  def sort_column
    self.model.column_names.include?(params[:sort]) ? params[:sort] : self.default_sort_column
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def default_sort_column
    "name"
  end

end

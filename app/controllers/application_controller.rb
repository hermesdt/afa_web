class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sort_column, :sort_direction, :tech_col_names

  def sort_column(model)
    model.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def tech_col_names
    Technique.column_names - ["id", "filename", "location", "recursively", "updated_at", "created_at", "technique_type_id", "plugin_id"]
  end
end

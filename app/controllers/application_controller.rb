class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sort_column, :sort_direction, :tech_col_names, :current_user, :logged_in  
      
  def sort_column(model)
    model.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def tech_col_names
    Technique.column_names - ["id", "filename", "location", "recursively", "updated_at", "created_at", "technique_type_id", "plugin_id"]
  end

  protected
  def authenticated!
    #raise Exception.new "User not logged" unless current_user
    redirect_to "/login" unless logged_in
  end
  
  def logged_in
    (current_user ) ?  true : false
  end

  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
end

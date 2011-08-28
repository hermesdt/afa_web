module ApplicationHelper

  def selected_class(path)
    (request.path[path])? "selected" : ""
  end

  def sortable(column, model)
    title = column.titleize
    css_class = column == sort_column(model) ? "current #{sort_direction}" : nil
    direction = column == sort_column(model) && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def can?(action, model)
    return false if current_user.nil?
    return true if current_user.is_admin?

    return current_user.can?(action, model)
  end

  def show_dialog
    '$("#dialog").html("' + escape_javascript(render(:partial => "form")) + '");' +
    '$("#fade").click(function() {' +
    ' $(this).hide();' +
    ' $("#dialog").hide();' +
    '});' +
    '$("#fade").show();' +
    '$("#dialog").show();'
  end

  def hide_dialog
    '$("#dialog").html("");' +
    '$("#fade").hide();' +
    '$("#dialog").hide();'
  end

  def ajax_for_create(params)
    error_tag_id = params[:error_explanation_tag_id]
    model = params[:model]
    object = params[:object]
    select_tag_id = params[:select_tag_id]

    res = '$("#'+error_tag_id+'").html("");'

    if object.errors.any?
      res = res +
        '$("#'+error_tag_id+'").html("'+escape_javascript(render :partial => "error_explanation")+ '");' +
        '$("#dialog").effect("shake", {times: 3}, 100);'
    elsif model == Category or model == TechniqueType
      res = res +
        raw(hide_dialog()) +
        '$("#'+select_tag_id+'").html("'+escape_javascript(options_for_select(model.order("updated_at desc").all.collect {|c| [c.name, c.id]}))+'");' +
        '$("#super_notice").html("'+escape_javascript(flash.delete(:notice))+'");'
    elsif model == Tag
      res = res + 
        raw(hide_dialog()) + 
        '$("#tag_cloud").html("'+escape_javascript(get_all_tags_as_links)+'");' +
        '$("#super_notice").html("'+escape_javascript(flash.delete(:notice))+'");'
    end

  end

  def image_rss
    image_tag "rss.png"
  end

  def image_blog
    image_tag "blog.png"
  end

  def image_manage_abilities
    image_tag "manage_abilities.png"
  end

  def image_users
    image_tag "users.png"
  end

  def image_add
    image_tag "add.png"
  end

  def image_xml
    image_tag "xml.png"
  end

  def image_destroy
    image_tag "destroy.png"
  end

  def image_edit
    image_tag "edit.png"
  end

  def image_show
    image_tag "show.png"
  end

  def image_technique
    image_tag "technique.png"
  end

  def get_all_tags_as_links 
    res = ""

    Tag.all.each do |t|
      res = res + " "+link_to(t.name, {:controller => 'plugins', :action => 'add_tag', :id => t.id}, :remote => true)
    end
    return raw res
  end

end

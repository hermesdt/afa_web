module HelpHelper

  def anchor_link(options = {})
    options[:name] ||= options[:text].downcase
    link_to options[:text], "#", :name => options[:name], :onclick => "return false;"
  end

end

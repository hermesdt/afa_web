xml.instruct!
xml.plugins do
  @plugins.each do |plugin|
    xml.plugin do
      xml.name(plugin.name)
      xml.category(plugin.category.name)
      xml.location(url_for(plugin)+".xml")
      xml.last_updated(plugin.updated_at.to_i.to_s + "000")
    end
  end
end

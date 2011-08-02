xml.instruct!
xml.declare! :DOCTYPE, :plugin, :SYSTEM, '../Plugin.dtd'
xml.plugin do
  xml.metadata do
    xml.name(@plugin.name)
    xml.os(@plugin.os)
    xml.category(@plugin.category.name)
    xml.author(@plugin.author)
    xml.description(@plugin.description)

    #add 000 to make timemiliseconds compatible
    xml.last_updated(@plugin.updated_at.to_i.to_s + "000")

    #show tags
    xml.tags do
      @plugin.tags.each do |tag|
        xml.tag(tag.name)
      end
    end
  end

  xml.techniques do
    @plugin.techniques.each do |technique|

      xml.technique do
        xml.name(technique.filename) if not technique.filename.blank?
        xml.type(technique.technique_type.name)
        xml.location(technique.location) if not technique.location.blank?
        xml.recursively(technique.recursively)

        #necesario usar metodo tag! porque sino da fallo,
        #metodo hash ya existe en todos los objetos
        xml.tag!('hash') do
          xml.type(technique.hash_type)
          xml.value(technique.hash_value)
        end if(not technique.hash_type.blank? and
               not technique.hash_value.blank?)

        xml.content(technique.content) if not technique.content.blank?
        xml.mimetype(technique.mimetype) if not technique.mimetype.blank?
      end

    end
  end
end

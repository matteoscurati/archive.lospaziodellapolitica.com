module ImportAuthors
  def import_authors
    file = File.open("./import/articoli.xml")
    doc = Nokogiri::XML(file)
    Rails.logger.info "Open XML file"
    doc.xpath("/pma_xml_export/table[@name='wp_users']").each do |auth|
      Author.create({
        id: auth.xpath("column[@name='ID']").text,
        name: auth.xpath("column[@name='user_login']").text
      })
    end
  end
end

module ImportAuthors
  def import_authors
    Rails.logger.info "Start to import LSDP's authors"
    file = File.open("./import/articoli.xml")
    doc = Nokogiri::XML(file)
    Rails.logger.info "Open XML file"
    doc.xpath("/pma_xml_export/table[@name='wp_users']").each do |auth|
      auth_id = auth.xpath("column[@name='ID']").text
      auth_name = auth.xpath("column[@name='user_login']").text
      Author.create({
        id: auth_id,
        name: auth_name
      })
      Rails.logger.info "Created: #{auth_id} - #{auth_name}"
    end
  end
end

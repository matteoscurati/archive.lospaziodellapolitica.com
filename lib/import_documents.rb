require 'pathname'

module ImportDocuments
  def import_documents
    pdf = Dir.glob("./public/documents/pdf/*.pdf")
    Rails.logger.info "I'm ready to import #{pdf.count} documents"

    count = 0

    pdf.each do |file|
      file_name = File.basename(file, ".pdf")
      Document.create({
        title: file_name
      })
      count += 1
      Rails.logger.info "Created: #{file_name}: #{count}"
    end
  end
end

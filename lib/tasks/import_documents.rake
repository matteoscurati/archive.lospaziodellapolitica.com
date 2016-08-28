require 'import_documents'

namespace :import_documents do
  include ImportDocuments

  desc "Create documents from all pdf files"
  task import_documents: :environment do
    import_documents
  end
end

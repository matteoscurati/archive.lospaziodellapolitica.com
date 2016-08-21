require 'import_authors'

namespace :import_authors do
  include ImportAuthors

  desc "Import authors from a LSDP's xml file"
  task import_authors: :environment do
    import_authors
  end
end

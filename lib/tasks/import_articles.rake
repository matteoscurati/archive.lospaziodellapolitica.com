require 'import_articles'

namespace :import_articles do
  include ImportArticles

  desc "Import articles from a LSDP's xml file"
  task import_articles: :environment do
    import_articles
  end
end

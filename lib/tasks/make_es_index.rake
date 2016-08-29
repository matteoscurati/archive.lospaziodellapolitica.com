namespace :make_es_index do

  desc "Create index for Elasticsearch"
  task create_index: :environment do
    Article.reindex
    Rails.logger.info "Article's index done"
    Author.reindex
    Rails.logger.info "Author's index done"
  end
end

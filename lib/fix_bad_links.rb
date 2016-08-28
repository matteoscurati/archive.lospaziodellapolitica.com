module FixBadLinks
  def fix_bad_links
    articles = Article.all
    Rails.logger.info "Start to fix bad links in old articles"
    articles.each do |art|
      content = art.content
      content = content.gsub(/http:\/\/www.lospaziodellapolitica.com\/wp-content/, "")
      content = content.gsub(/https:\/\/www.lospaziodellapolitica.com\/wp-content/, "")
      art.update(content: content)
    end
  end
end

module ImportArticles
  def import_articles
    Rails.logger.info "Start to import LSDP's articles"
    file = File.open("./import/articoli.xml")
    doc = Nokogiri::XML(file)
    Rails.logger.info "Open XML file"

    articles = []

    doc.xpath("/pma_xml_export/table[@name='wp_posts']").each do |post|
      article = {}

      date_text = post.xpath("column[@name='post_date']").text
      date_text = date_text[0, 10]
      date_format = "%Y-%m-%d"
      date = Date.strptime(date_text, date_format)
      id = post.xpath("column[@name='ID']").text
      title = post.xpath("column[@name='post_title']").text
      content = post.xpath("column[@name='post_content']").text
      author = post.xpath("column[@name='post_author']").text

      article[:id] = id
      article[:title] = title
      article[:date] = date
      article[:content] = content
      article[:author_id] = author

      articles << article
    end
    Rails.logger.info "Raw articles: #{articles.count}"

    articles.uniq! { |article| article[:content] }
    Rails.logger.info "Articles deduplicated: #{articles.count}"

    articles.delete_if { |article| article[:title].empty? }
    Rails.logger.info "Articles with a valid title: #{articles.count}"

    articles.delete_if { |article| article[:content].empty? }
    Rails.logger.info "Articles with a valid content: #{articles.count}"

    articles.delete_if { |article| article[:author_id].empty? }
    Rails.logger.info "Articles with a valid author_id: #{articles.count}"

    articles = articles.sort_by { |article| article[:id] }.reverse
    articles.uniq! { |article| article[:title] }
    Rails.logger.info "Total articles deduplicated by version: #{articles.count}"

    articles.each do |article|
      Article.create({
        id: article[:id],
        title: article[:title],
        date: article[:date],
        content: article[:content],
        author_id: article[:author_id]
      })
    end

    Rails.logger.info "Created #{articles.count} articles"

  end
end

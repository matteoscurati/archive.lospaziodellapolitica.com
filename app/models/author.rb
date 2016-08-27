class Author < ApplicationRecord
  has_many :articles

  scope :ordered_by_articles, -> {
    select("authors.id, authors.name, count(articles.id) as articles_count")
    .joins(:articles)
    .group("authors.id")
    .order("articles_count DESC")
  }
end

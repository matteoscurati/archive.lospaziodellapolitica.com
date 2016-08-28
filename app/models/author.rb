class Author < ApplicationRecord
  has_many :articles, dependent: :destroy

  scope :ordered_by_articles, -> {
    select("authors.id, authors.name, count(articles.id)")
    .joins(:articles)
    .group("authors.id")
    .order("count(articles.id) DESC")
  }
end

class Article < ApplicationRecord
  searchkick language: "italian"

  belongs_to :author
  validates :title, :content, :date, presence: true

  scope :created, -> {
    order(date: :desc)
  }

  def search_data
    attrs = attributes.dup
    relational = {
      author_name: author.name
    }
    attrs.merge! relational
  end
end

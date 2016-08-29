class Article < ApplicationRecord
  searchkick

  belongs_to :author
  validates :title, :content, :date, presence: true

  scope :created, -> {
    order(date: :desc)
  }

  def search_data
    attributes.merge(
      author_name: author.name
    )
  end
end

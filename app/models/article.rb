class Article < ApplicationRecord
  belongs_to :author
  validates :title, :content, :date, presence: true

  scope :created, -> {
    order(date: :desc)
  }
end

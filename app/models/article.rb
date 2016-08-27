class Article < ApplicationRecord
  belongs_to :author, counter_cache: true
  validates :title, :content, :date, presence: true

  scope :created, -> {
    order(date: :desc)
  }
end

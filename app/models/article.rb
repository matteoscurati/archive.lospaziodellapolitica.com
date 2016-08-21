class Article < ApplicationRecord
  belongs_to :author
  validates :title, :content, :date, presence: true
end

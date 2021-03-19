class Article < ApplicationRecord
  validates :title, presence: true, length: { in: (3..15) }
  validates :body, presence: true,length: { in: (15..200) }
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
end

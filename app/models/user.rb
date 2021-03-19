class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: (3..10) }
  has_many :authored_articles,class_name: 'Article', foreign_key: :author_id, dependent: :destroy
end

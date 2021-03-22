class Article < ApplicationRecord
  validates :title, presence: true, length: { in: (3..30) }
  validates :body, presence: true,length: { in: (15..200) }
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_many :votes, dependent: :destroy
  #has_one_attached :image
  include ImageUploader::Attachment(:image)

  # accepts_nested_attributes_for :categories 
end

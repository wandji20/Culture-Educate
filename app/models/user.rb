class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: (3..10)}
end

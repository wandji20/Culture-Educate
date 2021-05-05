require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:categories) }
    it {
      should validate_length_of(:body)
        .is_at_least(15).is_at_most(2000)
    }
  end

  context 'associations for article' do
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:votes) }
    it { should belong_to(:author) }
    it { should have_db_column(:body) }
    it { should have_one_attached(:image) }
  end
end

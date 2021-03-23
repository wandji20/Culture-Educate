require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it {
      should validate_length_of(:name)
        .is_at_least(3).is_at_most(10)
    }
  end

  context 'Associations' do
    it { should have_many(:authored_articles) }
    it { should have_many(:votes) }
  end
end

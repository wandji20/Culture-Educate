require 'rails_helper'

RSpec.describe Category, type: :model do
  fixtures :categories

  context 'validation' do
    it 'validates name presence' do
      should validate_presence_of(:name)
    end

    it 'validates name uniqueness' do
      should validate_uniqueness_of(:name)
    end
  end
end

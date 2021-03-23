require 'rails_helper'

RSpec.describe Article, type: :model do

  fixtures :users, :articles

  context 'title validation' do
    it 'saves article with valid attributes' do
      article = articles(:article1)
      expect(article.valid?).to be true
    end
    it 'validates title presence' do
      article = articles(:article4)
      expect(article.valid?).to be false
    end
  end

  context 'Body validation' do
    it 'validates body length' do
      article = articles(:article2)
      expect(article.valid?).to be false
    end
  end

  context 'associations for article' do
    it { should belong_to(:author) }
    it { should have_db_column(:body) }
    it { should have_db_column(:image_data )}
  end

end

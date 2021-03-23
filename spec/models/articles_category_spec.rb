require 'rails_helper'

RSpec.describe ArticlesCategory, type: :model do
  context 'associations for articlescategories' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
    it { should have_db_column(:article_id) }
    it { should have_db_column(:category_id) }
  end
end

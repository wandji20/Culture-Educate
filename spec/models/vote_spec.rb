require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end

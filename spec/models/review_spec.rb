require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:note) }
    it { should validate_presence_of(:comment) }
    it { should belong_to(:book) }
  end
end

require 'rails_helper'

RSpec.describe 'Create Book', type: :request do
  # let(:user) { create(:user) }
  # before(:each) do
  #   sign_in user
  # end

  context 'Doing a valid book' do
    it 'Creating book' do
      user = create(:user)
      sign_in user
      post '/api/books', params: { book: attributes_for(:book) }

      expect(response).to have_http_status 201
    end
  end
end


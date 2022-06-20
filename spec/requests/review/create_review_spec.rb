require 'rails_helper'

RSpec.describe 'Create Review', type: :request do
  let(:user) { create(:user) }
  before(:each) do
    sign_in user
  end

  context 'Doing a valid review' do
    it 'Creating review' do
      book = create(:book)
      post "/api/books/#{book.id}/reviews", params: { review: attributes_for(:review) }

      expect(response).to have_http_status 201
    end
  end

  context 'Doing a invalid review' do
    context  do
      it 'Creating review with invalid book' do
        post "/api/books/#{SecureRandom.uuid}/reviews", params: { review: attributes_for(:review) }

        expect(response).to have_http_status 422
      end
    end
  end
end


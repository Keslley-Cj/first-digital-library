require 'rails_helper'

RSpec.describe 'Create User', type: :request do
  context 'Doing a valid user' do
    it 'Creating user' do
      user = build(:user)

      user_params = {
        name: user.name,
        email: user.email,
        password: user.password
      }

      post '/api/users', params: { user: user_params }

      expect(response).to have_http_status 201
    end
  end

  context 'Doing a invalid attributes' do
    context ' - E-mail in use' do
      it ' - must return error' do
        user = create(:user)

        user_params = {
          name: user.name,
          email: user.email,
          password: user.password
        }

        post '/api/users', params: { user: user_params }

        expect(response).not_to have_http_status 201
        expect(response).to have_http_status 422
      end
    end
  end
end


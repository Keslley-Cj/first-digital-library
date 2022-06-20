module Api
  class UsersController < ApplicationController
    deserializable_resource :user

    before_action :authenticate_api_user!, except: :create

    def index
      CRUDManagement::Index.perform(
        paginate_params.merge(ransack_params: ransack_options),
        index_with_pagination_callback,
        User
      )
    end

    def create
      CRUDManagement::Create.perform(
        user_params,
        default_create_callbacks,
        User
      )
    end

    private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password)
    end
  end
end
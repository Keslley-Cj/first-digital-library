module Api
  class BooksController < ApplicationController
    deserializable_resource :book

    before_action :authenticate_api_user!

    def index
      CRUDManagement::Index.perform(
        paginate_params.merge(ransack_params: ransack_options),
        index_with_pagination_callback,
        Book
      )
    end

    def create
      CRUDManagement::Create.perform(
        book_params,
        default_create_callbacks,
        Book
      )
    end

    private

    def book_params
      params.require(:book).permit(:id, :title, :author, :genre)
    end
  end
end
module Api
  class ReviewsController < ApplicationController
    deserializable_resource :review

    before_action :authenticate_api_user!

    def index
      success_callback = lambda do |caller|
        render jsonapi: caller, class: {OpenStruct: SerializableIndexReview}, status: :ok
      end
      ReviewManagement::Index.perform(
        paginate_params.merge(ransack_params: ransack_options),
        { success: success_callback, error: error_callback_default},
        Review
      )
    end

    def create
      CRUDManagement::Create.perform(
        book_params.merge(book_id: book_id),
        default_create_callbacks,
        Review
      )
    end

    private

    def book_params
      params.require(:review).permit(:id, :note, :comment)
    end

    def book_id
      params.require(:book_id)
    end
  end
end
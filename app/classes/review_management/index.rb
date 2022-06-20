# frozen_string_literal: true

module ReviewManagement
  class Index < CRUDManagement::Index
    attr_reader :reviews, :notes

    def initialize(params, callbacks, klass)
      super
      @notes = 0
    end

    def index
      @list = load_object
      set_average_grade
      callbacks[:success]&.call(create_struct)
    end

    private

    def create_struct
      OpenStruct.new(reviews: list, average_grade: notes)
    end

    def set_average_grade
      list.pluck(:note).each do |item|
        @notes += item.to_i
      end
      return if notes.zero?

      @notes = notes / list.count
    end
  end
end

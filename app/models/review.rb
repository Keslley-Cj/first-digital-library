class Review < ApplicationRecord
  belongs_to :book
  validates :note, :comment, presence: true
end
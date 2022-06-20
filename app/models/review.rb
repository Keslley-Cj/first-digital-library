class Review < ApplicationRecord
  belongs_to :book
  validates :note, :comment, presence: true

  # has_enumeration_for :note, class: Note, create_helpers: true, create_scopes: true
end
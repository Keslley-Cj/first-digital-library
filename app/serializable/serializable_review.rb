class SerializableReview < JSONAPI::Serializable::Resource
  type 'review'
  attributes :id, :note, :comment
end
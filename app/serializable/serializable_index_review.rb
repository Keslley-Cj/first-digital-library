class SerializableIndexReview < JSONAPI::Serializable::Resource
  type 'review'
  attributes :id, :reviews, :average_grade
end
class SerializableBook < JSONAPI::Serializable::Resource
  type 'book'
  attributes :id, :title, :author, :genre
end
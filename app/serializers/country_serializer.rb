class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :states
 end
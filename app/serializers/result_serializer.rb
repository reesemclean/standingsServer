class ResultSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :result_participants
end

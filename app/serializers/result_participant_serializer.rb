class ResultParticipantSerializer < ActiveModel::Serializer
  attributes :team_id, :status
  has_one :team
end

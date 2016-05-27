class ResultParticipant < ApplicationRecord
  enum status: [ :won, :lost, :tied ]
  belongs_to :result, inverse_of: :result_participants
  belongs_to :team, inverse_of: :result_participants
end

class Result < ApplicationRecord
  belongs_to :league, inverse_of: :results
  has_many :result_participants, dependent: :destroy, inverse_of: :result
end

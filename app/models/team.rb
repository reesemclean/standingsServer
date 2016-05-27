class Team < ApplicationRecord

  belongs_to :league, inverse_of: :teams
  has_many :result_participants, inverse_of: :team

  validates :name, presence:true,
                   length: { minimum: 3, maximum: 100 }


  def result_summary
    win_count = 0
    loss_count = 0
    tie_count = 0
    for result_participant in result_participants
      case result_participant.status
      when "won"
        win_count += 1
      when "lost"
        loss_count += 1
      when "tied"
        tie_count += 1
      end
    end

    return win_count, loss_count, tie_count
  end
end

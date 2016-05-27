class League < ApplicationRecord

  has_many :teams, dependent: :destroy, inverse_of: :league
  has_many :results, dependent: :destroy, inverse_of: :league

  validates :name, presence:true,
                   length: { minimum: 3, maximum: 100 }
end

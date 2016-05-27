class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :permits_ties
  has_many :teams
end

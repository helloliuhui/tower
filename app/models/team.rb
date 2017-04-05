class Team < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :projects

  has_many :team_relationships
  has_many :members, through: :team_relationships, source: :user

end

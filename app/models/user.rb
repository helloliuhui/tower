class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams
  has_many :projects

  has_many :team_relationships
  has_many :participated_teams, :through => :team_relationships, :source => :team

  def is_member_of?(team)
    participated_teams.include?(team)
  end
end

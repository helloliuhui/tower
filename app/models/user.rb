class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams
  has_many :projects
  has_many :todos
  has_many :comments

  has_many :team_relationships
  has_many :participated_teams, :through => :team_relationships, :source => :team

  has_many :accesses
  has_many :participated_projects, :through => :accesses, :source => :project

  def is_member_of?(team)
    participated_teams.include?(team)
  end

  def join!(team)
    participated_teams << team
  end

  def quit!(team)
    participated_teams.delete(team)
  end
end

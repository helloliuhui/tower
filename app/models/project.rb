class Project < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :todos

  has_many :accesses
  has_many :members, through: :accesses, source: :user

  validates :title, presence: true

  scope :recent, -> { order("created_at DESC")}

end

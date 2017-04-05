class Project < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :title, presence: true

  scope :recent, -> { order("created_at DESC")}

end
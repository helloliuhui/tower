class Comment < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  belongs_to :team
  belongs_to :project

  validates :content, presence: true
end

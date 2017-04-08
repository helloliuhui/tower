class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :project

  has_many :comments

  def finish!
    self.update_columns(is_finished: true )
  end

  def unfinish!
    self.update_columns(is_finished: false )
  end


end

class AddCommentContentToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :comment_content, :text
  end
end

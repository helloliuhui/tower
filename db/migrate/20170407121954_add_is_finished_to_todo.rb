class AddIsFinishedToTodo < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :is_finished, :boolean, default: false
  end
end

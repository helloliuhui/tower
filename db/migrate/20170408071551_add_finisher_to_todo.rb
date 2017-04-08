class AddFinisherToTodo < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :finisher, :string
  end
end

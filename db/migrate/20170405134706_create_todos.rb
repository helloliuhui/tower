class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :title
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end

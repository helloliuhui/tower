class AddAasmStateToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :aasm_state, :string
    add_index  :events, :aasm_state
  end
end

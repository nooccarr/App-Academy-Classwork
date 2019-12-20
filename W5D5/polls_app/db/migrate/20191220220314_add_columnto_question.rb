class AddColumntoQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :answer_choice_id, :integer, null: false
  end
end

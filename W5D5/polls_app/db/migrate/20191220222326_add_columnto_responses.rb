class AddColumntoResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :answer_choice_id, :integer, null: false
  end
end

class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer :creator_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end

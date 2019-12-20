class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end

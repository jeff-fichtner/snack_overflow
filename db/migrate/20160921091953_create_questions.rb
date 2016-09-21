class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :name do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps(null: false)
    end
  end
end

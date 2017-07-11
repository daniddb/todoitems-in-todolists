class CreateTodoitems < ActiveRecord::Migration[5.0]
  def change
    create_table :todoitems do |t|
      t.date :item_due
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :todolist, foreign_key: true

      t.timestamps
    end
  end
end

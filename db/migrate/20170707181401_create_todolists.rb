class CreateTodolists < ActiveRecord::Migration[5.0]
  def change
    create_table :todolists do |t|
      t.string :list_name
      t.date :list_due
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

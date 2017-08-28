class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done, default: false, null: false
      t.datetime :deadline
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end

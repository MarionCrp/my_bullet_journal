class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :position
      t.string :type
      t.boolean :enable, default: true

      t.timestamps
    end

    create_table :tasks do |t|
      t.string :type
      t.string :title
      t.references :parent_task, references: :tasks
      t.date :date
      t.boolean :done, default: false
      t.references :category, index: true

      t.timestamps
    end
  end
end

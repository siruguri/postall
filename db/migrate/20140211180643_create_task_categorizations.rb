class CreateTaskCategorizations < ActiveRecord::Migration
  def change
    create_table :task_categorizations do |t|
      t.integer :task_id
      t.integer :category_id

      t.timestamps
    end
  end
end

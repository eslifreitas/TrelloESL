class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :history_id
      t.boolean :done

      t.timestamps
    end

    add_foreign_key :tasks, :histories, column: :history_id
  end
end

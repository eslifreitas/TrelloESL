class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :name
      t.integer :requester_id
      t.string :status, index: true
      t.integer :owner_id
      t.integer :project_id
      t.text :description
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :deadline
      t.integer :points

      t.timestamps

    end

    add_foreign_key :histories, :persons, column: :requester_id
    add_foreign_key :histories, :persons, column: :owner_id
    add_foreign_key :histories, :projects, column: :project_id
  end
end


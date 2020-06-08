class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.bigint :manager_id

      t.timestamps      
    end
    
    add_foreign_key :projects, :persons, column: :manager_id

  end
end

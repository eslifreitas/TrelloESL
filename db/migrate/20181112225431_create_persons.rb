class CreatePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :persons do |t|
      t.string :name
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end

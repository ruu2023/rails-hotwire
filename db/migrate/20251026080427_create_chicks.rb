class CreateChicks < ActiveRecord::Migration[8.1]
  def change
    create_table :chicks do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

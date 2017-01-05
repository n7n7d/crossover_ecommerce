class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :description
      t.string :name
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end

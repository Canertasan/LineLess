class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.string :name, null: false
      t.integer :capacity, null: false
      t.boolean :available, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.string :name, null: false
      t.references :organizer, foreign_key: { to_table: :users }, null: false
      t.integer :max_size
      t.string :budget
      t.text :description

      t.timestamps
    end
  end
end

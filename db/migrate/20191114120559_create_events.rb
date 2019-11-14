class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.string :name
      t.references :created_by, foreign_key: { to_table: :users }
      t.integer :max_participant
      t.string :budget
      t.text :description

      t.timestamps
    end
  end
end

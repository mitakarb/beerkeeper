class CreateEventCancellations < ActiveRecord::Migration[8.1]
  def change
    create_table :event_cancellations do |t|
      t.belongs_to :event, null: false, foreign_key: true, index: { unique: true }
      t.string :reason

      t.timestamps
    end
  end
end

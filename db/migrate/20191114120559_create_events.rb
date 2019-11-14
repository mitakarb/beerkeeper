class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|

      t.timestamps
    end
  end
end

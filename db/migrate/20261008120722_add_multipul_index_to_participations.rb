class AddMultipulIndexToParticipations < ActiveRecord::Migration[8.1]
  def change
    add_index :participations, [:event_id, :user_id], unique: true
  end
end

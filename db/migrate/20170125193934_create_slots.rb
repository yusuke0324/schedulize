class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.string :title
      t.integer :capacity
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.timestamps
    end
  end
end

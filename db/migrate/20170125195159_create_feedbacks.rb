class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
    	t.string :comment
    	t.integer :rating, :slot_id, :user_id

      t.timestamps
    end
  end
end

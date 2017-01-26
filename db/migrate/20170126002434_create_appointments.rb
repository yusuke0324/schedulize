class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|

      t.references :user
      t.references :slot

      t.timestamps
    end
  end
end

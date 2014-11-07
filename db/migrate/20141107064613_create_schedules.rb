class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :appointment_id
      t.integer :service_id
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end

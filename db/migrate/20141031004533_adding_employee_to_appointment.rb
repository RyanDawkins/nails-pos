class AddingEmployeeToAppointment < ActiveRecord::Migration
  def up
    add_column :appointments, :employee_id, :integer
  end

  def down
    remove_column :appointments, :employee_id
  end
end

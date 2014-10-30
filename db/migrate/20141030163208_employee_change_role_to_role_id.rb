class EmployeeChangeRoleToRoleId < ActiveRecord::Migration
  def change
    rename_column :employees, :role, :role_id
  end
end

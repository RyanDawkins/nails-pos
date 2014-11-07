class ChangeSchedulePrecision < ActiveRecord::Migration
  def change
    change_column :schedules, :cost, :decimal, :precision => 5, :scale => 2
  end
end

class ChangeServicePrecisionCost < ActiveRecord::Migration
  def change
    change_column :services, :cost, :decimal, :precision => 5, :scale => 2
  end
end

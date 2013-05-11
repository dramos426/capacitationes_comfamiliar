class RemoveColumnValorFromCapacitacions < ActiveRecord::Migration
  def change
    remove_column :capacitacions, :valor
  end
end

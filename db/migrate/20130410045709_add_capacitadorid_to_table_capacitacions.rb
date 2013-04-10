class AddCapacitadoridToTableCapacitacions < ActiveRecord::Migration
  def change
  	add_column :capacitacions, :capacitador_id, :integer
  end
end

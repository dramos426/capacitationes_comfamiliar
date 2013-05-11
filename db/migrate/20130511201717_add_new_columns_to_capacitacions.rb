class AddNewColumnsToCapacitacions < ActiveRecord::Migration
  def change
    add_column :capacitacions, :valor_base, :float
    add_column :capacitacions, :valor_cat_a, :float
    add_column :capacitacions, :valor_cat_b, :float
    add_column :capacitacions, :valor_cat_c, :float
    add_column :capacitacions, :valor_cat_d, :float
    add_column :capacitacions, :cat_e, :boolean
    add_column :capacitacions, :valor_cat_e, :float
  end
end

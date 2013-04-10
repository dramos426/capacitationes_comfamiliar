class CreateCapacitacionUsuarios < ActiveRecord::Migration
  def change
    create_table :capacitacion_usuarios do |t|
      t.references :usuario
      t.references :capacitacion

      t.timestamps
    end
    add_index :capacitacion_usuarios, :usuario_id
    add_index :capacitacion_usuarios, :capacitacion_id
  end
end

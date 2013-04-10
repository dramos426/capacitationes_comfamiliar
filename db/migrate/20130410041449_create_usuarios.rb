class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombres
      t.string :apellidos
      t.string :tipo_identificacion
      t.string :identificacion
      t.string :telefono
      t.string :email
      t.string :categoria

      t.timestamps
    end
  end
end

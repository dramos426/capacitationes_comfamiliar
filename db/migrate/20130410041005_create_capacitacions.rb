class CreateCapacitacions < ActiveRecord::Migration
  def change
    create_table :capacitacions do |t|
      t.string :tema
      t.float :valor
      t.datetime :fecha
      t.string :institucion
      t.text :observaciones

      t.timestamps
    end
  end
end

class CreateDatos < ActiveRecord::Migration[5.1]
  def change
    create_table :datos do |t|
      t.string :presion
      t.string :tempeatura
      t.string :humedad
      t.string :carga
      t.string :clima

      t.timestamps
    end
  end
end

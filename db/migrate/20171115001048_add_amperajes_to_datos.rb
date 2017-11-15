class AddAmperajesToDatos < ActiveRecord::Migration[5.1]
  def change
    add_column :datos, :cbateria, :string
    add_column :datos, :cconsumo, :string
  end
end

class AddNewValuesToDatos < ActiveRecord::Migration[5.1]
  def change
    add_column :datos, :enegiaEntrada, :string
    add_column :datos, :energiaSalida, :string
  end
end

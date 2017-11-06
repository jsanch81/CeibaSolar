class AddAmbienteToDatos < ActiveRecord::Migration[5.1]
  def change
    add_column :datos, :precipitacion, :string
    add_column :datos, :windSpeed, :string
    add_column :datos, :windDir, :string
  end
end

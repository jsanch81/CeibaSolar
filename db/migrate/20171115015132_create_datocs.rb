class CreateDatocs < ActiveRecord::Migration[5.1]
  def change
    create_table :datocs do |t|
      t.string :cconsumo
      t.string :cbateria

      t.timestamps
    end
  end
end

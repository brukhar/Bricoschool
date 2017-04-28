class CreateTaches < ActiveRecord::Migration[5.1]
  def change
    create_table :taches do |t|
      t.string :nom
      t.float :prix
      t.float :temps

      t.timestamps
    end
  end
end

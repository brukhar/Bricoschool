class AddCreateurToAnnonces < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :createur, :int
  end
end

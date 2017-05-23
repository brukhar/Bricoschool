class AddSecteurToUtilisateur < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :secteur, :int
  end
end

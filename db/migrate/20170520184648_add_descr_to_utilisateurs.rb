class AddDescrToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :descr, :string
  end
end

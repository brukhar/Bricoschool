class AddNumeroToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :numero, :string
  end
end

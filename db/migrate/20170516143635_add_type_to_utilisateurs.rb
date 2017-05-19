class AddTypeToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :type, :string
  end
end

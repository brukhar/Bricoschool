class RenameColumnTypeToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    rename_column :utilisateurs, :type, :compte
  end
end

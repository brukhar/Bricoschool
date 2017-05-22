class AddLogoToUtilisateur < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :logo_uid, :string
  end
end

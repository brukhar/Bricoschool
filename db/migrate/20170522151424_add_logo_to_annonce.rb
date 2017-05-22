class AddLogoToAnnonce < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :logo_uid, :string
  end
end

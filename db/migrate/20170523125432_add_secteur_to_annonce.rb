class AddSecteurToAnnonce < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :secteur, :int
  end
end

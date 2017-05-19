class AddPreneurToAnnonces < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :preneur, :int
  end
end

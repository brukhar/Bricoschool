class CreateAnnonces < ActiveRecord::Migration[5.1]
  def change
    create_table :annonces do |t|
      t.string :titre
      t.string :descr

      t.timestamps
    end
  end
end

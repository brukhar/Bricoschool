class CreateBranchePros < ActiveRecord::Migration[5.1]
  def change
    create_table :branche_pros do |t|
      t.string :nom

      t.timestamps
    end
  end
end

class CreateSecteurs < ActiveRecord::Migration[5.1]
  def change
    create_table :secteurs do |t|
      t.string :nom

      t.timestamps
    end
  end
end

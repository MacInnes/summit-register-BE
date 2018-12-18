class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name
      t.int :altitude
      t.string :summit
      t.string :difficulty
      t.string :range

      t.timestamps
    end
  end
end

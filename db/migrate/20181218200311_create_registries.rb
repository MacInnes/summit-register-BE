class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :hometown
      t.string :comments
      t.integer :peak_id

      t.timestamps
    end
  end
end

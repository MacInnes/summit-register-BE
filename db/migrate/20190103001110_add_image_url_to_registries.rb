class AddImageUrlToRegistries < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :image_url, :string
  end
end

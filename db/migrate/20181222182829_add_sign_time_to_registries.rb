class AddSignTimeToRegistries < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :sign_time, :string
  end
end

class AddUserIdToRegistries < ActiveRecord::Migration[5.2]
  def change
    add_reference :registries, :user, foreign_key: true
  end
end

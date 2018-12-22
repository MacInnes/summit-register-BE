class Registry < ApplicationRecord
  validates_presence_of :name, :hometown, :comments, :mountain_id, :sign_time

  belongs_to :mountain
end

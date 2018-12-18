class Registry < ApplicationRecord
  validates_presence_of :name, :hometown, :comments, :mountain_id

  belongs_to :mountain
end

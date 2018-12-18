class Registry < ApplicationRecord
  validates_presence_of :name, :hometown, :comments, :peak_id
end

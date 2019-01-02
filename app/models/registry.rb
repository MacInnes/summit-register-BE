class Registry < ApplicationRecord
  validates_presence_of :name, :hometown, :comments, :mountain_id, :sign_time, :user_id


  belongs_to :mountain
  belongs_to :user

end

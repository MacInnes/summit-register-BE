class Mountain < ApplicationRecord
  validates_presence_of :name, :altitude, :summit, :difficulty, :range

  has_many :registries
end

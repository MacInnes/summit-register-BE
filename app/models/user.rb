require 'securerandom'

class User < ApplicationRecord
  validates_presence_of :name, :uid

  has_many :registries

  def generate_api_key
    update(api_key: SecureRandom.urlsafe_base64) unless api_key
  end
end

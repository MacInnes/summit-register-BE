class RegistrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :hometown, :comments, :sign_time, :image_url

  attribute :date do |object|
    "#{object.created_at}"
  end

  attribute :user do |object|
    object.user.name
  end

  attribute :mountain do |object|
    object.mountain.name
  end

end

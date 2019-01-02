class RegistrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :hometown, :comments

  attribute :date do |object|
    "#{object.created_at}"
  end

  attribute :user do |object|
    object.user.name
  end

end

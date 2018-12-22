class RegistrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :hometown, :comments, :sign_time

  attribute :date do |object|
    "#{object.created_at}"
  end

end

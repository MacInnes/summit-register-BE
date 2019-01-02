class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :api_key

  attribute :registries do |object|
    RegistrySerializer.new(object.registries)
  end
  
end

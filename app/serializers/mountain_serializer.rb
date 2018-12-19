class MountainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :altitude, :summit, :difficulty, :range

  attribute :registries do |object|
    RegistrySerializer.new(object.registries)
  end
end

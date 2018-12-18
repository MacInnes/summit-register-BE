class MountainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :altitude, :summit, :difficulty, :range
end

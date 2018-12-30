require 'rails_helper'

describe User do
  it 'exists' do
    user = User.create(name: "Andrew")
    expect(user).to be_a(User)
    expect(User.first.name).to eq(user.name)
  end

  it 'can generate a unique api-key' do
    user = User.create(name: "Andrew")
    expect(user.api_key).to be_nil
    user.generate_api_key
    expect(user.api_key).to_not be_nil

  end
end

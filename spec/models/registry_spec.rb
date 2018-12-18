require 'rails_helper'

describe Registry do

  before(:each) do
    @registry = Registry.create(
      name: "Andrew",
      hometown: "PV",
      comments: "Great hike",
      peak_id: 1
    )
  end

  it 'exists' do
    expect(@registry).to be_a(Registry)
  end

  it 'has attributes' do
    expect(@registry.name).to eq("Andrew")
    expect(@registry.hometown).to eq("PV")
    expect(@registry.comments).to eq("Great hike")
    expect(@registry.peak_id).to eq(1)
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :comments }
    it { should validate_presence_of :peak_id }
  end
end

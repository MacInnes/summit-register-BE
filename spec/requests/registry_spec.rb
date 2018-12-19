require 'rails_helper'

describe 'Registry' do
  before(:each) do
    @mountain = Mountain.create(
      name: 'Mt. Elbert',
      altitude: 14433,
      summit: "39.118075,-106.445417",
      difficulty: "Blue",
      range: "Sawatch"
    )
    @registry1 = Registry.create(
      name: "Andrew",
      hometown: "PV",
      comments: "Great hike",
      mountain_id: @mountain.id
    )
    @registry2 = Registry.create(
      name: "Andrew",
      hometown: "Denver",
      comments: "Wow so dope",
      mountain_id: @mountain.id
    )
    bad_mountain = Mountain.create(
      name: 'Bad mountain',
      altitude: 1000000,
      summit: "39.118075,-106.445417",
      difficulty: "Blue",
      range: "Sawatch"
    )
    @bad_registry = Registry.create(
      name: "Tom",
      hometown: "Somewhere",
      comments: "I hate hiking",
      mountain_id: bad_mountain.id
    )

  end
  it 'serializes properly' do
    get "/api/v1/mountains/#{@mountain.id}"

    body = JSON.parse(response.body, symbolize_names: :true)
    expect(response).to be_successful

    expect(body[:data][:attributes][:registries][:data].length).to eq(2)
    expect(body[:data][:attributes][:registries][:data].first[:attributes][:hometown]).to eq(@registry1.hometown)
    expect(body[:data][:attributes][:registries][:data]).to_not include(@bad_registry)
  end
end
require 'rails_helper'

describe '/api/v1' do
  before(:each) do
    Mountain.create(
      name: 'Mt. Elbert',
      altitude: 14433,
      summit: "39.118075,-106.445417",
      difficulty: "Blue",
      range: "Sawatch"
    )
    Mountain.create(
      name: 'Mt. Massive',
      altitude: 14421,
      summit: "39.187298,-106.475548",
      difficulty: "Blue",
      range: "Sawatch"
    )
    @harvard = Mountain.create(
      name: 'Mt. Harvard',
      altitude: 14420,
      summit: "38.924328,-106.320618",
      difficulty: "Blue",
      range: "Sawatch"
    )
  end
  it 'responds properly to /api/v1/mountains' do

    get "/api/v1/mountains"

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(body[:data].first[:attributes][:name]).to eq("Mt. Elbert")
    expect(body[:data].second[:attributes][:name]).to eq("Mt. Massive")
  end
  it 'responds properly to /api/v1/mountains' do

    get "/api/v1/mountains/#{@harvard.id}"

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(body[:data][:attributes][:name]).to eq("Mt. Harvard")
    expect(body[:data][:attributes][:altitude]).to eq(14420)
    expect(body[:data][:attributes][:summit]).to eq("38.924328,-106.320618")
    expect(body[:data][:attributes][:difficulty]).to eq("Blue")
    expect(body[:data][:attributes][:range]).to eq("Sawatch")
  end
end

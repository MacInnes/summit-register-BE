require 'rails_helper'

describe '/api/v1' do
  it 'responds properly to /api/v1/mountains' do
    get "/api/v1/mountains"

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(body[:data].length).to eq(61)
    expect(body[:data].first[:attributes][:name]).to eq("Mt. Elbert")
  end
end

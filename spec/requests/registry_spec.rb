require 'rails_helper'

describe 'Registry' do
  before(:each) do
    @user = User.create(
      name: "Anonymous"
    )
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
      mountain_id: @mountain.id,
      user_id: @user.id
    )
    @registry2 = Registry.create(
      name: "Andrew",
      hometown: "Denver",
      comments: "Wow so dope",
      mountain_id: @mountain.id,
      user_id: @user.id
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

  it 'can post to /api/v1/mountains/:id/registries' do
    request_body = {
      name: "This guy",
      hometown: "NY",
      comments: "Look at this guy",
      mountain_id: @mountain.id,
      user_id: @user.id # TODO: reformat this to use user auth key
    }
    post "/api/v1/mountains/#{@mountain.id}/registries", params: request_body

    response_body = JSON.parse(response.body, symbolize_names: :true)
    expect(response).to be_successful
    expect(response_body[:data].length).to eq(3)
    expect(response_body[:data].last[:attributes][:hometown]).to eq(request_body[:hometown])
  end

  it "can't post to /api/v1/mountains/:id/registries with invalid data" do
    request_body = {
      name: "This guy",
      hometown: "NY",
      mountain_id: @mountain.id
    }

    post "/api/v1/mountains/#{@mountain.id}/registries", params: request_body

    response_body = JSON.parse(response.body, symbolize_names: :true)
    expect(response.status).to eq(400)
    expect(response_body[:message]).to eq("Invalid request, missing required parameters.")
  end

  it "user id defaults to 1 if none is provided" do
    request_body = {
      name: "This guy",
      hometown: "NY",
      comments: "Look at this guy",
      mountain_id: @mountain.id
    }
    post "/api/v1/mountains/#{@mountain.id}/registries", params: request_body

    response_body = JSON.parse(response.body, symbolize_names: :true)

    expect(response).to be_successful
    expect(response_body[:data].length).to eq(3)
    expect(response_body[:data].last[:attributes][:hometown]).to eq(request_body[:hometown])
  end

end

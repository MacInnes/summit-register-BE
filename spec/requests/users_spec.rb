require 'rails_helper'

describe '/api/v1' do
  it 'can create a user via POST /api/v1/users' do
    payload = {
      name: "Andrew",
      uid: "asdf"
    }

    post '/api/v1/users', params: payload

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(body[:data][:attributes][:name]).to eq("Andrew")
    expect(body[:data][:attributes][:api_key]).to_not be_nil
  end

  it "can't create a user without a username or uid" do
    payload = {
      username: "Invalid",
    }

    post '/api/v1/users', params: payload

    body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(body[:message]).to eq("Invalid request")
  end

  it "can view all of a user's registries" do
    @user = User.create(
      name: "Anonymous",
      uid: "iewibcwyerjvhb3468"
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
      user_id: @user.id,
      sign_time: "12/21/18 9:16am"
    )
    @registry2 = Registry.create(
      name: "Andrew",
      hometown: "Denver",
      comments: "Wow so dope",
      mountain_id: @mountain.id,
      user_id: @user.id,
      sign_time: "12/21/18 9:16am"
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

    get "/api/v1/users/#{@user.id}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body[:data][:attributes][:name]).to eq(@user.name)
    expect(response_body[:data][:attributes][:registries][:data].length).to eq(2)
  end

  it "can't get a user that doesn't exist" do
    @user = User.create(
      name: "Anonymous",
      uid: "ireiubdjklsnc8632"
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

    get "/api/v1/users/#{@user.id + 1}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body[:message]).to eq("Unable to find user")

  end
end

require 'rails_helper'

describe Mountain, type: :model do
  before(:each) do
    @elbert = Mountain.create(
      name: 'Mt. Elbert',
      altitude: 14433,
      summit: "39.118075,-106.445417",
      difficulty: "Blue",
      range: "Sawatch"
    )
    end
  describe "it exists" do
    it "exists" do

      expect(@elbert).to be_a(Mountain)
    end
  end
  describe "attributes" do
    it "has attributes" do

      expect(@elbert.name).to eq('Mt. Elbert')
      expect(@elbert.altitude).to eq(14433)
      expect(@elbert.summit).to eq("39.118075,-106.445417")
      expect(@elbert.difficulty).to eq('Blue')
      expect(@elbert.range).to eq('Sawatch')
    end
  end
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :altitude }
    it { should validate_presence_of :summit }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :range }
  end
end

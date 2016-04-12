require_relative "../lib/team"

describe Team do
  it "has a name" do
    expect(Team.new("Random name")).to respond_to :name
  end

  it "has a list of players" do
    expect(Team.new("Random name").players).to be_kind_of Array
  end

  it "is favored if it has a celebrity in it" do
    expect( Team.new("Random name", [ "George Clooney", "Jose Mota" ]) ).to be_favored
  end

  it "complains if there is a bad word in the name" do
    expect { Team.new("Crappy name") }.to raise_error(Exception, "Bad name detected")
  end

  context "given a bad list of players" do
    let(:bad_players) { {} }

    it "fails to create given a bad player list" do
      expect{ Team.new("Random name", bad_players) }.to raise_error(Exception, "Expected players as array")
    end
  end
end

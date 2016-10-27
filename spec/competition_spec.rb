require_relative '../lib/team'
require_relative '../lib/competition'
require_relative 'support/matchers/team_support'

describe Competition do
  let(:competition) { Competition.new }
  let(:team) { Team.new("Random name") }

  context "having no questions" do
    before { competition.stub(:questions => []) }
    # before { competition.questions = [] }

    it "doesn't accept any teams" do
      expect(competition).not_to allow_teams_to_enter
      # competition.should_not allow_teams_to_enter
      # expect do
      #   team.enter_competition(competition)
      # end.to raise_error Competition::Closed
    end
  end

  context "having questions" do
    before { competition.questions = [ { :title => "Question" } ] }
    subject { competition }

    it { should allow_teams_to_enter }
  end
end

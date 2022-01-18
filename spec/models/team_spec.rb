require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many :players }
  it {should have_many(:competition_teams)}
  it {should have_many(:competitions).through :competition_teams}

  it "checks for the average of all player on a team" do

    competition1 = Competition.create!(name: "Competition 1", location: "Location 1", sport: "Sport 1")
    competition2 = Competition.create!(name: "Competition 2", location: "Location 1", sport: "Sport 1")

    team1 =  Team.create!(hometown: "hometown 1", nickname: "nickname 1")
    team2 = Team.create!(hometown: "hometown 2", nickname: "nickname 2")

    ct1 = CompetitionTeam.create!(competition: competition1, team: team1)
    ct2 = CompetitionTeam.create!(competition: competition1, team: team2)

    player1 = Player.create!()

    expect()
  end
end

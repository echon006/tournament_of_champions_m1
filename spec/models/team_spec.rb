require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many :players }
  it {should have_many(:competition_teams)}
  it {should have_many(:competitions).through :competition_teams}

  it "checks for the average of all player on a team" do

    competition1 = Competition.create!(name: "Competition 1", location: "Location 1", sport: "Sport 1")

    team1 =  Team.create!(hometown: "hometown 1", nickname: "nickname 1")

    ct1 = CompetitionTeam.create!(competition: competition1, team: team1)

    player1 = Player.create!(name: "name 1", age: 20, team: team1)
    player2 = Player.create!(name: "name 2", age: 25, team: team1)
    player3 = Player.create!(name: "name 3", age: 30, team: team1)
    expect(team1.average_age).to eq(25)
  end

end

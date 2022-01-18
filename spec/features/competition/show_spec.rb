require 'rails_helper'

RSpec.describe 'Competition show page' do

  let!(:competition_1) { Competition.create!(name: "Competition 1", location: "Location 1", sport: "Sport 1")}
  let!(:competition_2) { Competition.create!(name: "Competition 2", location: "Location 1", sport: "Sport 1")}

  let!(:team_1) { Team.create!(hometown: "hometown 1", nickname: "nickname 1")}
  let!(:team_2) { Team.create!(hometown: "hometown 2", nickname: "nickname 2")}
  let!(:team_3) { Team.create!(hometown: "hometown 3", nickname: "nickname 3")}

  let!(:ct_1) { CompetitionTeam.create!(competition: competition_1, team: team_1)}
  let!(:ct_2) { CompetitionTeam.create!(competition: competition_1, team: team_2)}
  let!(:ct_3) { CompetitionTeam.create!(competition: competition_2, team: team_3)}

  let!(:player1) { Player.create!(name: "name 1", age: 20, team: team_1)}
  let!(:player2) { Player.create!(name: "name 2", age: 25, team: team_1)}
  let!(:player3) { Player.create!(name: "name 3", age: 30, team: team_2)}


  it "checks that the page has the competions information" do
    visit "/competitions/#{competition_1.id}"
    expect(page).to have_content(competition_1.name)
    expect(page).to have_content(competition_1.location)
    expect(page).to have_content(competition_1.sport)
  end

  it "checks that the page has all the teams and their information" do

    visit "/competitions/#{competition_1.id}"
    expect(page).to have_content(team_1.id)
    expect(page).to have_content(team_1.hometown)
    expect(page).to have_content(team_1.nickname)
    expect(page).to have_content(team_2.hometown)
    expect(page).not_to have_content(team_3.hometown)
  end

  it "checks that the teams average age is showing " do
    visit "/competitions/#{competition_1.id}"
    expect(page).to have_content(team_1.average_age)
    expect(page).to have_content(team_2.average_age)
  end

  it "has a link to create a new team" do
    visit "/competitions/#{competition_1.id}"
    click_on "New Team"
    expect(current_path).to eq("/competitions/#{competition_1.id}/teams/new")
  end
end

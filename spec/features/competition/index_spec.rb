require 'rails_helper'

RSpec.describe 'Competition show page' do

  let!(:competition_1) { Competition.create!(name: "Competition 1", location: "Location 1", sport: "Sport 1")}
  let!(:competition_2) { Competition.create!(name: "Competition 2", location: "Location 1", sport: "Sport 1")}
  let!(:competition_3) { Competition.create!(name: "Competition 3", location: "Location 2", sport: "Sport 2")}
  let!(:competition_4) { Competition.create!(name: "Competition 4", location: "Location 2", sport: "Sport 2")}

  it "checks that the page exist" do
    visit '/competitions'
  end

  it "checks for all the competitions" do
    visit '/competitions'
    save_and_open_page
    expect(page).to have_content(competition_1.name)
    expect(page).to have_content(competition_2.name)
    expect(page).to have_content(competition_3.name)
    expect(page).to have_content(competition_4.name)
  end
end

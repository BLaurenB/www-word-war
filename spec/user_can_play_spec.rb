require 'rails_helper'


describe "As a user" do

  it "I play a valid word" do

    visit "/"
    fill_in "word", with: "foxes"
    click_button "Validate Word"
    expect(page).to have_content("SUCCESS! foxes is a valid word and its root form is fox")
  end

  it "I play an invalid word" do
    visit "/"
    fill_in "word", with: "awoinuvtaow"
    click_button "Validate Word"
    expect(page).to have_content("Oh no! That wasn't a valid word!")

  end
end

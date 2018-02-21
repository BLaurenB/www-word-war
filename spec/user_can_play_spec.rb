require 'rails_helper'


describe "As a user" do

  it "I play a valid word" do

    visit "/"
    fill_in "word", with: "foxes"
    click_button "Validate Word"
    expect(page).to have_content("SUCCESS! foxes is a valid word and its root form is fox")
  end

  it "I play an invalid word" do
    # As a user
    # When I visit "/"
    # And I fill in a text box with "foxez"
    # And I click "Validate Word"
    # Then I should see a message that says "'foxez' is not a valid word."
  end
end

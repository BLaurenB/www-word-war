require 'rails_helper'


describe "As a user" do

  it "I play a valid word" do

    visit "/"
    # As a user
    # When I visit "/"
    # And I fill in a text box with "foxes"
    fill_in "play_word", with: "foxes"
    # And I click "Validate Word"
    click_button "Validate Word"
    # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
# This needs to post to the play#create method

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
  end

  it "I play an invalid word" do
    # As a user
    # When I visit "/"
    # And I fill in a text box with "foxez"
    # And I click "Validate Word"
    # Then I should see a message that says "'foxez' is not a valid word."
  end
end

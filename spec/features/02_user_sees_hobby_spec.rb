require 'rails_helper'

# [] Visiting the `/hobbies` path should contain a list of restaurants.
# [] Visiting the `/hobbies/10 path should show the details for a hobby with the ID of 10.
# [] Visiting the root path should display a list of all hobbies.

feature "user sees a list of his/her hobbies" do
  let(:sally) do
    User.create(
      provider: "github",
      uid: "2",
      username: "sallypikachu",
      email: nil,
      avatar_url: "https://avatars.githubusercontent.com/u/6314533?v=3"
    )
  end
  before :each do
    visit '/'
    sign_in_as sally
  end

  scenario "sees a list of hobbies and link for new hobby" do
    breaking = Hobby.create(name: "Breaking", description: "Become a bgirl that can show-up all the bboys", user: sally)
    ukulele = Hobby.create(name: "Playing the Ukulele", description: "Learn the rhythm and beat to creating feel good music", user: sally)

    visit hobbies_path

    expect(page).to have_content breaking.name
    expect(page).to have_link ukulele.name

    click_link "Add a New Hobby"

    expect(page).to have_content "New Hobby Form"
  end

  scenario "clicks link and is taken to show page for given hobby" do

    breaking = Hobby.create(name: "Breaking", description: "Become a bgirl that can show-up all the bboys", user: sally)

    visit hobbies_path

    click_link "Breaking"

    expect(page).to have_content breaking.name
    expect(page).to have_content breaking.description
  end
end

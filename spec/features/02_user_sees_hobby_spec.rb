require 'rails_helper'

# [] Visiting the `/hobbies` path should contain a list of restaurants.
# [] Visiting the `/hobbies/10 path should show the details for a hobby with the ID of 10.
# [] Visiting the root path should display a list of all hobbies.

feature "user sees a list of his/her hobbies" do
  scenario "sees a list of hobbies and link for new hobby" do

    sally = User.create(id: 1, provider: "github", uid: "6314533", username: "sallypikachu", email: nil, avatar_url: "https://avatars.githubusercontent.com/u/6314533?v=3")

    breaking = Hobby.create(name: "Breaking", description: "Become a bgirl that can show-up all the bboys", user: sally)
    ukulele = Hobby.create(name: "Playing the Ukulele", description: "Learn the rhythm and beat to creating feel good music", user: sally)

    visit hobbies_path

    expect(page).to have_content breaking.name
    expect(page).to have_link ukulele.name

    click_link "Add New Hobby"

    expect(page).to have_content "New Hobby Form"
  end

  scenario "clicks link and is taken to show page for given hobby" do
    sally = User.create(id: 1, provider: "github", uid: "6314533", username: "sallypikachu", email: nil, avatar_url: "https://avatars.githubusercontent.com/u/6314533?v=3")

    breaking = Hobby.create(name: "Breaking", description: "Become a bgirl that can show-up all the bboys", user: sally)

    visit root_path

    click_link "Breaking"

    expect(page).to have_content breaking.name
    expect(page).to have_content breaking.description
  end
end

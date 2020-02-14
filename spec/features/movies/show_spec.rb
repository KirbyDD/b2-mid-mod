require "rails_helper"

RSpec.describe "As a visitor to Actors Show Page", type: :feature do
  before(:each) do
    @studio = Studio.create!(name: "Tron Studios")
    @movie = @studio.movies.create!(name: "Space Biking", creation_year: "1990", genre: "Action")

    @actor1 = @movie.actors.create!(name: "Mike", age: 25)
    @actor2 = @movie.actors.create!(name: "Meg", age: 23)
    @actor3 = Actor.create!(name: "Pam", age: 24)
    visit "/movies/#{@movie.id}"
  end
  it 'should show studio name and all movies' do
    expect(page).to have_content(@movie.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content("Average Actor Age: 24")
    expect(page).to have_button("Add")
  end

  it 'should add actors if they exist through form' do
    expect(page).to_not have_content(@actor3.name)

    fill_in :name, with: @actor3.name
    click_on "Add"

    expect(current_path).to eq("/movies/#{@movie.id}")
    expect(page).to have_content(@actor3.name)
  end
end

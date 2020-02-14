require "rails_helper"

RSpec.describe "As a visitor to Actors Show Page", type: :feature do
  before(:each) do
    @studio = Studio.create!(name: "Tron Studios")
    @movie1 = @studio.movies.create!(name: "Life of Tron", creation_year: "1990", genre: "Action")
    @movie2 = @studio.movies.create!(name: "Killed by Kat", creation_year: "2008", genre: "Adventure")

    @actor1 = @movie1.actors.create!(name: "Meg", age: 23)
    @movie2.actors << @actor1

    @movie3 = @studio.movies.create!(name: "Animaniacs", creation_year: "1980", genre: "Comedy")
    @actor2 = @movie3.actors.create!(name: "Mike", age: 25)
  end
  it 'should show studio name and all movies' do
    visit "/actors/#{@actor1.id}"

    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor1.age)
    expect(page).to have_content(@movie1.name)
    expect(page).to have_content(@movie2.name)

    expect(page).to_not have_content(@actor2.name)
    expect(page).to_not have_content(@movie3.name)
  end
end

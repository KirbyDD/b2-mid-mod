require "rails_helper"

RSpec.describe "As a visitor to Studio Index Page", type: :feature do
  before(:each) do
    @studio1 = Studio.create!(name: "Tron Studios")
    @studio2 = Studio.create!(name: "WB")

    @movie1 = @studio1.movies.create!(name: "Life of Tron", creation_year: "1990", genre: "Action")
    @movie2 = @studio1.movies.create!(name: "Killed by Kat", creation_year: "2008", genre: "Adventure")

    @movie3 = @studio2.movies.create!(name: "Animaniacs", creation_year: "1980", genre: "Comedy")
  end
  it 'should show studio name and all movies' do
    visit "/studios"

    within "#studio-#{@studio1.id}" do
      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@movie1.name)
      expect(page).to have_content(@movie2.name)
      expect(page).to_not have_content(@movie3.name)
    end

    within "#studio-#{@studio2.id}" do
      expect(page).to have_content(@studio2.name)
      expect(page).to have_content(@movie3.name)
      expect(page).to_not have_content(@movie1.name)
      expect(page).to_not have_content(@movie2.name)
    end
  end
end

require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'methods' do
    xit 'should return all co_stars' do
      studio = Studio.create!(name: "Tron Studios")
      movie1 = studio.movies.create!(name: "Life of Tron", creation_year: "1990", genre: "Action")
      movie2 = studio.movies.create!(name: "Killed by Kat", creation_year: "2008", genre: "Adventure")

      actor1 = movie1.actors.create!(name: "Meg", age: 23)
      movie2.actors << actor1

      actor2 = movie2.actors.create!(name: "Mike", age: 25)
      actor3 = movie2.actors.create!(name: "Pam", age: 24)

      expect(actor1.co_stars.first).to eq(actor2)
      expect(actor1.co_stars.last).to eq(actor3)
    end
  end
end

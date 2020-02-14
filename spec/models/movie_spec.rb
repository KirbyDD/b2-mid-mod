require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'methods' do
    it 'should order actors from youngest to oldest order_actors' do
      studio = Studio.create!(name: "Tron Studios")
      movie = studio.movies.create!(name: "Space Biking", creation_year: "1990", genre: "Action")

      actor1 = movie.actors.create!(name: "Mike", age: 25)
      actor2 = movie.actors.create!(name: "Meg", age: 23)

      expect(movie.order_actors.first).to eq(actor2)
      expect(movie.order_actors.last).to eq(actor1)

    end

    it 'should give average age of actors avg_age' do
      studio = Studio.create!(name: "Tron Studios")
      movie = studio.movies.create!(name: "Space Biking", creation_year: "1990", genre: "Action")

      actor1 = movie.actors.create!(name: "Mike", age: 25)
      actor2 = movie.actors.create!(name: "Meg", age: 23)

      expect(movie.avg_age).to eq(24)
    end
  end
end

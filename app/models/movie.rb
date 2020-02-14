class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def order_actors
    actors.order(:age)
  end

  def avg_age
    actors.average(:age)
  end
end

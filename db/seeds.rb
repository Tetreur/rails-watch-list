List.destroy_all
Movie.destroy_all
Bookmark.destroy_all

require 'json'
require 'open-uri'
require 'faker'

url = "http://tmdb.lewagon.com/movie/top_rated"
res = URI.open(url)
json = JSON.parse(res.read)

movies = json['results']
lists = ["Drama", "Comedy", "Action", "Thriller", "Documentary"]

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

lists.each do |list|
  List.create!(
    name: list
  )
end

10.times do
  Bookmark.create!(
    movie_id: rand(Movie.first.id...Movie.last.id),
    list_id: rand(List.first.id...List.last.id),
    comment: Faker::GreekPhilosophers.quote
  )
end

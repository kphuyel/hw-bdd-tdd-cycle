class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.find_all_by_director director
    return nil if director == nil
    movies = Movie.where(director: director)
     
      return movies if movies.present?
  end
end

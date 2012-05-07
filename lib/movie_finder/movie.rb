module MovieFinder

  class Movie

    attr_reader :title, :year, :critics_consensus, :critics_score, :audience_score

    def initialize(title, critics_score, audience_score = nil, critics_consensus = nil, year = nil )
      @title = title
      @year= year
      @critics_score = critics_score
      @critics_consensus = critics_consensus
      @audience_score = audience_score
    end


    def to_s
      "#{@title}(#{@year}) #{@critics_consensus}, CS:#{@critics_score}, AS: #{@audience_score} "
    end

    def display_movie_scores
      "#{movie.title} [AS: #{movie.critics_score}"+
          (!movie.audience_score.nil? ? ", CS: #{movie.audience_score}] " : "] ")
    end

  end
end


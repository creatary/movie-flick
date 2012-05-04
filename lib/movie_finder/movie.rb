module MovieFinder

  class Movie

    attr_reader :title, :rating

    def initialize(title, rating)
      @title = title
      @rating = rating
    end

    def to_s
      "#{@title}:: #{@rating}"
    end

  end
end
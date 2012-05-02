module MovieFinder

  class Movie

    attr_reader :title, :rank

    def initialize(title, rank)
      @title = title
      @rank = rank
    end

    def to_s
      @title
    end

  end
end
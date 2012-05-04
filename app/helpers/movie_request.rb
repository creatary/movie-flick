class MovieRequest

  def initialize(body, from_user)

    arguments = body.split(" ")
    arguments.shift

    if arguments.empty?
      coordinates = SubscriberLocation.new.get_location from_user
      @location = coordinates.join(" ")
    else
      @location = arguments.join(" ")
    end

  end

  def location
    @location
  end

end
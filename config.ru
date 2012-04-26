require './movie-flick'


map "/" do
  run MovieFlick
end

map "/creatary/(:string)" do
  run Creatary::API
end
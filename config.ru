require './movie-flick'
require 'logger'
require 'creatary-sdk'

map "/" do
  run MovieFlick
end

map "/creatary/(:string)" do
  run Creatary::API
end
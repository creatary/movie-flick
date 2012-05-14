source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'google_movies'
gem 'creatary-sdk' , :git => 'https://github.com/creatary/creatary-ruby-sdk', :branch => 'fix-gemspec-issue'
gem 'nokogiri'
gem 'rottentomatoes'

# for Heroku deployment
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cucumber-rails' ,require: false
  gem 'cucumber-rails-training-wheels'  # some pre-fabbed step definitions                                                                                                                                                                                                     
  gem 'database_cleaner'  # to clear Cucumber's test database between runs                                                                                                                                                                                                     
  gem 'capybara'     # Cucumber pretend to be a web browser                                                                                                                                                                                                                    
  gem 'launchy'   # a useful debugging aid for user stories                                                                                                                                                                                                                    
  gem 'rspec-rails', '~> 2.9.0'                                                                                                                                                                                                                                                
  gem 'watchr'                                                                                                                                                                                                                                                                 
  gem 'fakeweb'                                                                                                                                                                                                                                                                
  gem 'simplecov' ,require: false                                                                                                                                                                                                                                              
end                                                                                                                                                                                                                                                                            
group :production do                                                                                                                                                                                                                                                           
  gem 'pg'
  gem 'uglifier'
  gem 'therubyracer'
end                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                               
# Gems used only for assets and not required                                                                                                                                                                                                                                   
# in production environments by default.                                                                                                                                                                                                                                       
#group :assets do                                                                                                                                                                                                                                                              
#  gem 'therubyracer'                                                                                                                                                                                                                                                          
#  gem 'sass-rails', "  ~> 3.1.0"                                                                                                                                                                                                                                              
#  gem 'coffee-rails', "~> 3.1.0"                                                                                                                                                                                                                                              
#  gem 'uglifier'                                                                                                                                                                                                                                                              
#end                                                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                               
gem 'jquery-rails'                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                               
gem 'haml'

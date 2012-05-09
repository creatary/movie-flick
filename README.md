Movie-Flick Application
=============

Sample application on top of Creatary platform.

You can use it to check movies in cinemas near your location or in given city.
You can also get rating and details about given movie.

Uses Creatary location API to locate subscriber

More information on www.creatary.com


Usage for Subscriber
-----------
movie-flick          -   returns list of best rated movies played in cinemas near Your location
movie-flick London   -   returns list of best rated movies played in cinemas in London
movie-flick cinema: Titanic         -   returns list cinemas where Titanic movie is played near your location
movie-flick movie: Titanic          -   returns ratings and details of movie with given title


Installation
-----------

To use application you need to deploy it in web and connect to Creatary platform

## Example deployment on heroku

  * install heroku client
  $ wget -qO- https://toolbelt.heroku.com/install.sh | sh
  * login using your heroku account
  $ heroku login
  * create application
  $ heroku create --stack cedar
  * push your changes to heroku
  $ git push heroku master

## Connecting to Creatary

  For more information about connecting your application to Creatary platform on www.creatary.com/documentation

Testing
-------

To run the tests:

$ rspec





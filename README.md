# Twitter
A Twitter clone in Rails for [Hackathon by the Sea](https://www.hackathonbythesea.com/)

## Getting Started
### Prerequisites
Download and install Docker
  - Mac: https://www.docker.com/docker-mac
  - Windows: https://www.docker.com/docker-windows
  - Ubuntu: https://www.docker.com/docker-ubuntu
### Setting up the app
1. Run `git clone https://github.com/mikestephens/twitter.git`
2. Run `cd twitter`
4. Run `docker-compose build`
3. Run `docker-compose up`
4. Hit `ctrl + c`
5. Run `docker-compose run web rake db:create db:setup`

If you see the error `web_1 | A server is already` run `rm tmp/pids/server.pid`

### Running the app
`docker-compose up` - Runs the app server so you can access it at `localhost:3000` in your browser

`docker-compose down` - Stops the app server

`docker-compose run web rake db:migrate` - Makes changes to the databases

`docker-compose run web bundle install` - Installs new gems

`docker-compose run web bundle exec rails c` - Runs the app console so you can interface with your code and your database

## Getting Started (Non Docker)
### Setting up the app
1. Run `git clone https://github.com/mikestephens/twitter.git`
2. Run `cd twitter`
3. Run `git checkout non_docker`
4. Run `bundle install`
5. Run `rake db:create`
6. Run `rake db:migrate`

### Running the app
`rails s` - Runs the app server so you can access it at `localhost:3000` in your browser
`ctrl + c` - Key combination to stop the Rails server
`rails c` - Runs the app console so you can interface with your code and your database

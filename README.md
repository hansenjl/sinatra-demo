# Hosting to Heroku

## Step 1 - setting up your environment
- Make an account at [heroku.com](https://www.heroku.com/)
- Download & install [Postgresql](https://www.postgresql.org/)

## Step 2 - create a Heroku app
- Log into your Heroku account
- Click 'New'  --> 'Create new app'
- Name your application

## Step 3 - Choose how you want to deploy your application
- Choose Heroku git or Github

## Step 4 - Change your Sinatra production database to Postgresql
- Group your Gemfile into development and production
- Move sqlite3 into the development group

```
group :development do
  gem 'sqlite3', '~> 1.3.6'
end
```

- Add postgresql to the production group

```
group :production do
  gem 'pg'
end
```

- delete the gemfile.lock and run `bundle install`

## Configure the Database
Create a `config/database.yml` file:

```
# config/database.yml
development:
  adapter: sqlite3
  encoding: unicode
  database: db/development.sqlite3
  pool: 5
production:
  adapter: postgresql
  encoding: unicode
  pool: 5
```

and we'll need to update our `config/environment.rb` file to use this file to establish a connection to our DB. To do that, replace these lines
```
# config/environment.rb
# ...

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
```
with
```
set :database_file, "./database.yml"
```
## Create a Procfile
- Add the `gem 'foreman'` to your gemfile
- Create a Procfile with the following code:
```
web: bundle exec thin start -p $PORT
release: bundle exec rake db:migrate
```

## Add Config Vars
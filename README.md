# README

## Introduction

This Rails 4.1.7 app sets up the basic code for a skeleton app:

* There some basic models, each meant to do somethign interesting:
  * Task: It borrows code from a standard scaffold structure. It showcases a simple association - belongs_to :owner, class_name: "User"
  * Location: It showcases geocoding.
* Devise and Cancan are set up:
  * Devise uses User as the model for authentication; no other config changes are made for Devise other than those in the default gem. Devise views are installed.
  * CanCan uses a simple authentication using the Task => User association
* Views (for Task) use HAML
* Controllers use strong parameters
* The layout puts notice and alert at the top of the page, and a float:right element to accommodate the user session (logged-in/out) state.
* The application layout uses Twitter Bootstrap CSS.
* Forms use [Formtastic Bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap).
* The app has Capistrano installed with some basic defaults that assist in making deployments to a remote folder via SSH, like sym-linking to an existing database, to the database config file so that credentials are not stored in the SCS, etc.

## Usage

Before you run your app, you have to prepare the baseline code as follows:

* At the very least, copy `config\database.yml.sample` to `config\database.yml`. You might want to also change the db or its creds.
* Change the app (class) name - there's a convenient shell script (`change_app_name.sh`) in the project root that does that using `sed` - you have to uncomment the line at the top of the script that sets your app name.
* Run migrations. Optionally, seed the database if you wish.
* Check the routes file and remove the latter half, after the comment that says that that part is probably not useful.
* Remove the Resque rake task if you aren't going to be using Resque.
* If you're going to deploy your app using the Capistrano config in it:
  * Change the config information in `config\deploy.rb` - the app name and its location
  * Change the domain name in `config\deploy\production.rb`
  * Set up a shared folder in your deployment where you store your `config\database.yml` file
* The locale file has the site's title, and the phrase that's in the Bootstrap navbar - you might want to change it.
* You might want to delete some models (`Task`, `Location`), their corresponding tests and migrations, and the corresponding routes. Also, you might want to get rid of the Google Maps API assets in `app\assets\javascripts\gmaps`. Remember to remove them from your repository, not just the filesystem.

## Security

The code attempts to be secure - it passes all Brakeman tests, as of Apr 2014. Particularly, it:

* moves `config/database.yml` to `config\database.yml.sample` in the repo and ignores the former, so that you are forced to set credentials in a non-committed file, and
* avoids using the stored session secret in production - in production, you have to store the secret token in the environment variable **RAILS_SECRET_TOKEN**.
  * If your production environment is Heroku, add this variable in Heroku like this:

        heroku config:add RAILS_SECRET_TOKEN=a-128-character-token-no-spaces-though-you-generated-as-a-secret
	
  * In development, the secret token is enabled in `config/initializers/secret_token.rb`. The app also uses the `dotenv-rails` gem to utilize a .env file in the app root as an alternate method if you don't even want to share your development secret token in your repo. You have to create the `.env` file and add the `RAILS_SECRET_TOKEN` variable to it, if you are using this method.

## Testing

The app also has some basic tests:

* It uses RSpec - `rails g rspec:install` has already been run for you.
* It uses Capybara.
* Unit tests for users and tasks - check that users can be created, and that tasks cannot be created when a user is not logged in.
* Rails Admin: The app now has Rails Admin installed. Note that installation was done by following [the basic steps](https://github.com/sferik/rails_admin#installation), and that the Devise lines in `config/initializers/rails_admin.rb` are uncommented. 
* Integration tests: None so far

## Resque

If you are going to use Resque, here are some things worth knowing about how it works:

* This app has the resque gem, as well as resque-web for the web interface and resque-scheduler. Consequently, it has a `Procfile` that lets you run all three tasks (your app, resque's worker queues, and resque scheduler's scheduling) by running `foreman`

## Heroku

You have to uncomment the `rails_12factor` gem in the Gemfile, if you are going to deploy this to Heroku. The checked-in Gemfile doesn't include it.

## Coming Soon!

I am not sure I'll add these - the configuration changes a lot, and these are not necessarily "commonly" used. But you might hold your breath a bit...

* Paperclip with S3: This can get complicated - first you should have a model for files that `belongs_to Imageable`, and build the appropriate polymorphic migration for the files model; then you configure S3 with credentials in your appropriate config file (bucket, S3 keys); then you configure your path, and add a `paperclip.rb` initializer optionally that adds an `interpolates` method to customize your URL.

* Elastic Search

## How Did The App Get Here?

If you are trying to do this from scratch, note that the following `rails` and `rake` commands are essential to getting the app to its current state, after your bundle is installed (though you also have to change the code obviously).

This list is unfortunately *not* complete - it's pretty hard to keep the list of migrations up-to-date. :(

    rails new baseline_rails_4_install
    rails generate model Task title:string owner_id:integer
    rails generate scaffold Location lat:float long:float name:string address:string	
    rails g migration AddAdminToUser admin:boolean
    rails g migration AddAgeToUser age:integer

These generate files, so you don't have to re-run them, but they are here for the sake of the record. This list too is probably incomplete:

    # Devise
    rails generate devise User
    rails generate devise:views

    # CanCan
    rails g cancan:ability

    # For rspec tests folders
    rails generate rspec:install

    # For formtastic
    rails generate formtastic:install

    # For Bootstrap Rails
    rails generate bootstrap:install less

<<<<<<< HEAD
    # For Rails Admin
    rails g rails_admin:install

=======
>>>>>>> rails4
    # There's probably stuff for geocoding, gmaps4rails, and doorkeeper ... not sure if that's the case.

## Addenda

* Upgrade to Formtastic Bootstrap 3 requires [custom change to Formtastic Bootstrap code](https://github.com/mjbellantoni/formtastic-bootstrap/issues/108)

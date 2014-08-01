# README

## Introduction

This Rails 4.1.2 app sets up the basic code for a skeleton app:

* There some basic models, each meant to do somethign interesting:
  * Task: It borrows code from a standard scaffold structure. It showcases a simple association - belongs_to :owner, class_name: "User"
  * Location: It showcases geocoding.
* Devise and Cancan are set up:
  * Devise uses User as the model for authentication; no other config changes are made for Devise other than those in the default gem. Devise views are installed.
  * CanCan uses a simple authentication using the Task => User association
* Views (for Task) use HAML
* Layouts uses Twitter Bootstrap CSS.
* Forms use [Formtastic Bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap).
* The app has Capistrano installed with some basic defaults that assist in making deployments to a remote folder via SSH, like sym-linking to an existing database, to the database config file so that credentials are not stored in the SCS, etc.

## Usage

Before you run your app, you have to prepare the baseline code as follows:

* At the least copy `config\database.yml.sample` to `config\database.yml`. You might want to also change the db or its creds.
* Change the app (class) name - there's a convenient shell script (`change_app_name.sh`) in the project root that does that using `sed` - you have to uncomment the line at the top of the script that sets your app name.
* Run migrations. Optionally, seed the database if you wish.
* If you're going to deploy your app using the Capistrano config in it:
  * Change the config information in `config\deploy.rb` - the app name and its location
  * Change the domain name in `config\deploy\production.rb`
  * Set up a shared folder in your deployment where you store your `config\database.yml` file

## Security

The code attempts to be secure - it passes all Brakeman tests, as of Apr 2014. Particularly, it:

* moves `config/database.yml` to `config\database.yml.sample` in the repo and ignores the former, so that you are forced to set credentials in a non-committed file, and
* avoids using the stored session secret in production - in production, you have to store the secret token in the environment variable **RAILS_SECRET_TOKEN**. To enable this, the app uses the `dotenv-rails` gem to utilize a .env file in the production environment. You have to create this file - it's not stored in the repo for security reasons.

## Testing

The app also has some basic tests:

* It uses RSpec - `rails g rspec:install` has already been run for you.
* It uses Capybara.
* Unit tests for users and tasks - check that users can be created, and that tasks cannot be created when a user is not logged in.
* Integration tests: None so far

## Heroku

You have to uncomment the `rails_12factor` gem in the Gemfile, if you are going to deploy this to Heroku. The checked-in Gemfile doesn't include it.

## Coming Soon!

I am not sure I'll add these - the configuration changes a lot, and these are not necessarily "commonly" used. But you might hold your breath a bit...

* Rails Admin: Install as per [the basic steps](https://github.com/sferik/rails_admin#installation), then uncomment the Devise lines in `config/initializers/rails_admin.rb`, and [add Devise authorization](https://github.com/sferik/rails_admin/wiki/Authorization) (assuming your `User` model responds to `is_admin?`).

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

    # There's probably stuff for geocoding, gmaps4rails, and doorkeeper ... not sure if that's the case.
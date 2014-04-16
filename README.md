# README

## Introduction

This Rails 4.1 app sets up the basic code for a skeleton app:

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


## Security

The code attempts to be secure - it passes all Brakeman tests, as of Apr 2014. Particularly, it:

* removes the `config/database.yml` file from the repo, and
* avoids using the stored session secret in production - in production, you have to store the secret token in the environment variable **RAILS_SECRET_TOKEN**. To enable this, the app uses the `dotenv-rails` gem to utilize a .env file in the production environment. You have to create this file - it's not stored in the repo for security reasons.

## Testing

The app also has some basic tests:

* It uses RSpec - `rails g rspec:install` has already been run for you.
* It uses Capybara.
* Unit tests for users and tasks - check that users can be created, and that tasks cannot be created when a user is not logged in.
* Integration tests: None so far

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

    # There's probably stuff for geocoding and gmaps4rails... not sure if that's the case.
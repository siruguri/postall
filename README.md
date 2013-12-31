# README

## Introduction

This Rails 4 app sets up the basic code for a skeleton app:

* There some basic models, each meant to do somethign interesting:
  * Task: It borrows code from a standard scaffold structure. It showcases a simple association - belongs_to :owner, class_name: "User"
  * Location: It showcases geocoding.
* Devise and Cancan are set up:
  * Devise uses User as the model for authentication; no other config changes are made for Devise other than those in the default gem. Devise views are installed.
  * CanCan uses a simple authentication using the Task => User association
* Views (for Task) use HAML
* The layout puts notice and alert at the top of the page, and a float:right element to accommodate the user session (logged-in/out) state.

## Testing

The app also has some basic tests:

* It uses RSpec - `rails g rspec:install` has already been run for you.
* Unit tests for users and tasks - check that users can be created, and that tasks cannot be created when a user is not logged in.
* Integration tests: None so far

## How Did The App Get Here?

If you are trying to do this from scratch, note that the following `rails` and `rake` commands are essential to getting the app to its current state, after your bundle is installed (though you also have to change the code obviously).

This list is unfortunately *not* complete - it's pretty hard to keep this up-to-date, especially the migrations. :(

    rails new baseline_rails_4_install
    rails generate model Task title:string owner_id:integer
    rails generate scaffold Location lat:float long:float name:string address:string	
    rails generate devise User
    rails generate devise:views
    rails g cancan:ability
    rails g migration AddAdminToUser admin:boolean
    rails g migration AddAgeToUser age:integer

    # For tests
    rails generate rspec:install
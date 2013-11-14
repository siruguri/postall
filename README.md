# README

This Rails app sets up the basic code for a skeleton app:

* There's one model, called Task. It borrows code from a standard scaffold structure.
  * Task has an association - belongs_to :owner, class_name: "User"
* Devise and Cancan are set up:
  * Devise uses User as the model for authentication; no other config changes are made for Devise other than those in the default gem. Devise views are installed.
  * CanCan uses a simple authentication using the Task => User association
* Views (for Task) use HAML
* The layout puts notice and alert at the top of the page, and a float:right element to accommodate the user session (logged-in/out) state.
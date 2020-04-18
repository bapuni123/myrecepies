# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Minitest

Layout of the application

Integration Testing

Model Tests - unit testing

TDD -design the app functionality based on a test first approach
write the test for the functionality
Build minimun code necessart to make each test pass

deleting the migration 
command: rails d migration table_name(migration_name)

Re-factor the code - *code doesnt smell* - clean code, confidence
www.learn.sayhowe.com for learning html and css


Routes:
Prefix       Verb   URI Pattern          Controller#Action

recipes      GET     /recipes             recipes#index
new_recipe   GET     /recipes/new         recipes#new         #displays a form
             POST    /recipes             recipes#create      #submit the informatin from the form
edit_recipe  GET     /recipes/:id/edit    recipes#edit        #display an edit form
             PATCH   /recipes/:id         recipes#update      #submit the edit form information
recipe       GET     /recipes/:id         recipes#show        #display a particular recipe
             DELETE  /recipes/:id         recipes#destroy     #deletes a particular recipe
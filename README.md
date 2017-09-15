# README HI

https://under-review.herokuapp.com/


![Build Status](https://codeship.com/projects/fd594640-7491-0135-5e9a-22a90e89452a/status?branch=master)
![Code Climate](https://codeclimate.com/github/Jose-N/under_review.png)
![Coverage Status](https://coveralls.io/repos/github/Jose-N/under_review/badge.svg?branch=master)



Under_Review

Under_Review is a totally awesome jawn where you can submit and rate your favorite reviews from anywhere online.  Rate reviews in four categories, including Troll, Funny, Story, and Helpful. This app is equipped with an aggregate rating system, so you can discover which submitted reviews are the Trolliest, Funniest, Storiest, and Helpfulest overall.

Getting Started

Please clone this repo down to your machine.  Before you start the server, be sure to 'bundle install' from your terminal to make sure all gems are up-to-date and configured properly.  Also use 'rake db:create' to generate a postGres database on your local machine.  Then run 'db:migrate' to create necessary tables.

Installing

This app requires the installation of multiple gems and dependencies.  Please see Gemfile. Always check for deprecations or new versions of software/gems.

Running the Tests

Run 'rake' command or 'rspec' to run all tests for this app.  Tests are written for all types of functionality, including features for User, Submissions, Search, Screenshot, etc; This app has outstanding verified coverage using, Codeship, Code Climate, and Coveralls. If you intend to run tests, please use 'rake db:test:prepare' before using the 'rake' or 'rspec' commands.  

Deployment

This app is build on a Ruby-On-Rails framework, with a React heavy front end.  To run these concurrently, use the command 'foreman start -f Procfile.dev' to launch the app from your terminal onto your local server.

Built With

ruby (2.3.3)
rails (~> 5.1.2)
react
postgresQL


Contributing

Please read Contributing.md for details on our code of conduct, and the process for submitting pull requests to us.

Authors

Jose Naylor
Ashlei Perry
Kristen Jordan
Thomas Wilson

Contributors who participated on this project:

Kylee Acker
David MacMurtie
Sebastian Kopp
Arielle Landau
Lots of help from our fellow Launchers at the Philly 3 Launch Academy cohort

Acknowledgments

This jawn would not have been possible without the persistent meta-contrarianism of modern-day hipsters and the nonsensical nomenclature of Philadelphia.

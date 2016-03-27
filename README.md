# PaleoPal
## A food diary web application for the health conscious eater

Author: Penney Garrett

Live Version: [http://paleopal.herokuapp.com/](http://paleopal.herokuapp.com/)

### Overview

This Ruby on Rails application was designed to help people record each of their meals and keep track of macronutrient intake
throughout the day. It is geared toward someone wanting to eat a Paleo diet.

After logging in with Facebook, a new user is prompted to created their first food diary entry. For each meal the user records
the date, meal, all individual ingredients consumed, and any relevant thoughts or information they would like to remember.
Upon clicking 'calculate' an AJAX call is made to the Edamam API and the subsequent macronutrients (carbs, protein, and fat) are rendered on the page. The user can then save the entry which is rendered on their dashboard for future reference. The dashboard
also shows the day end totals for all logged meals.

The application is [hosted live on Heroku](http://paleopal.herokuapp.com/).

### Application In Action (click on image to watch)

[![Screenshot](/app/assets/images/paleopal-screenshot.png)](http://g.recordit.co/kpokuqv43i.gif)

### Dependencies

To run this application locally, you would need to obtain the Nutrition Data API from Edamam:

* [Edamam](https://developer.edamam.com/)

Gem dependencies can be found in the Gemfile.

### Setup

If you wish to download the project and set it up locally, run the following commands:

1. `git clone https://github.com/PenneyGadget/paleopal.git`
2. `bundle`
3. `bundle exec figaro install` - This sets up figaro on your local machine. You will need to obtain the keys mentioned in the above section and save them in your `application.yml` file.
4. Run `rails s` to start the Rails server
5. Visit http://localhost:3000/

### Test Suite

This test suite is written in [RSpec](https://github.com/rspec/rspec-rails) and utilizes [Capybara](https://github.com/jnicklas/capybara) for feature tests and [VCR](https://github.com/vcr/vcr) for easy recording and playback of API calls. [SimpleCov](https://github.com/colszowka/simplecov) has been installed to provide test coverage reports.

The test suite can be run from the main directory of the project by running the command `rspec`.

### Additional Information

This was my personal project for the 3rd module at [Turing School of Software and Design](http://turing.io).

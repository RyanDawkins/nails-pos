[![Code Climate](https://codeclimate.com/github/RyanDawkins/nails-pos/badges/gpa.svg)](https://codeclimate.com/github/RyanDawkins/nails-pos)

# Nails Point of Sale Application
This application is under the [MIT License](http://opensource.org/licenses/MIT) or you can look at LICENSE.md
The purpose of this application is to be a scheduling assistant for nail salons.

  * Here's our Trello: https://trello.com/b/g1uyuywQ/nails-pos
  * CodeClimate and Travis-ci coming soon!

## Dependencies
  * Ruby version: We use 2.0, so we recommend 2.0+
  * We recommend you install [brew](http://brew.sh) if you are a mac user.
  * MySQL
    * OSX: ``` brew install mysql ```
    * Ubuntu: ``` apt-get install mysql-server mysql-client libmysql-ruby libmysqlclient-dev```

  * Postgresql
    * OSX:
      * ``` brew install postgresql ```
      * ``` ARCHFLAGS="-arch x86_64" gem install pg ```
    * Ubuntu:
      * ``` apt-get install postgresql-9.1 libpq-dev ```

## After installation...
After you finally are able to make bundle install work you will need to edit your configurations.
  * Edit config/database.yml to your appropriate MySQL settings.
  * Ensure ``` rake db:create db:migrate ``` runs correctly
  * Finally run ``` rake test ``` and all of the tests should pass assuming your on the master branch.

## Contributing!
Please look at CONTRIBUTING.md for details!

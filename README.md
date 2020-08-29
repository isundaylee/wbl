# MIT WBL Website

## How to run this locally for development

1. Install rbenv with instructions from https://github.com/rbenv/rbenv
2. `git clone` this Git repo to your local computer, and `cd` into the the repository.
3. Run `rbenv install 2.6.5` to install Ruby 2.6.5.
4. Run `rbenv local 2.6.5`
5. Run `gem install bundler`
6. Run `bundle install --path vendor` to install dependency packages.
7. Copy `config/database.yml.example` file to `config/database.yml`.
8. Run `bundle exec rake db:migrate` to create/setup the database.
9. Run `bundle exec rails server` to start the local website server. You should be able to go to http://localhost:3000 in your browser to see the site. Note that loading the website for the first time might take a bit of time.

### How to access the admin panel during development

The username/password for the admin panel is set using environment variables. To be able to access it, you need to export the following environment variables:

```
export WBL_ADMIN_USERNAME="some_username"
export WBL_ADMIN_PASSWORD="some_password"

# Then launch the server with:
bundle exec rails server
```

With this, you should be able to go to http://localhost:3000/admin, and use the username/password you chose above to access the admin panel.

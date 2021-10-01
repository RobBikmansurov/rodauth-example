TODO: https://janko.io/adding-multifactor-authentication-in-rails-with-rodauth/

https://janko.io/adding-authentication-in-rails-with-rodauth/
```
$ git clone https://gitlab.com/janko-m/rails_bootstrap_starter.git rodauth_blog
$ cd rodauth_blog
$ bin/setup
```
Let’s start by adding the rodauth-rails gem to our Gemfile:
```
$ bundle add rodauth-rails
$ rails generate rodauth:install
$ rails db:migrate
```
## Adding authentication links
```
$ rails rodauth:routes
app/views/application/_navbar.html.erb
```

## Requiring authentication
We could add a before_action callback to the controller, but Rodauth allows us to do this inside the Rodauth app’s route block, which is called before each Rails route. This way we can keep our authentication logic contained in a single place.

app/lib/rodauth_app.rb
```
$ rails generate migration add_account_id_to_posts account:references
$ rails db:migrate
``
app/models/account.rb

app/controllers/posts_controller.rb


## Adding new fields

`$ rails generate rodauth:views`

app/views/rodauth/create_account.erb

```
rails generate model Profile account:references name:string
rails db:migrate
```
app/models/account.rb

app/lib/rodauth_app.rb







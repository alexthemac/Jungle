# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Can view Jungle application on http://localhost:3000/

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

Input any date after current date and any 3 numbers for CVC.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Testing

* Testing dependencies: 
  * Rspec 
  * Capybara 
  * Poltergeist 
  * Phantomjs (npm) 
  * DatabaseCleaner
* Rspec tests are in spec folder
* Execute Rspec tests in command line via: 
  * bin/rspec spec/________ --format documentation
  * where ________ is the remaining filepath (if nested directory) or filename

## Functionality

# Login/register

![Login/register](https://github.com/alexthemac/Jungle/blob/master/docs/LoginRegisterLogin.gif)

# Add to cart and purchase

![Add to cart and purchase](https://github.com/alexthemac/Jungle/blob/master/docs/AddToCartAndPurchase.gif)


# Admin create category and product

![Admin create category and product](https://github.com/alexthemac/Jungle/blob/master/docs/AdminLoginCreate.gif)

# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
In this app user can sign-up, login, logout,put a review and delete the reviews that he has put before.
Admin require to enter his username and password when clicking on the Admin dropdown.
User can add or remove products to or from his cart.
User can pay for his order and the app sends the user information about the ordered products and the total price and the email used for payment.

# photos
- !["First page of the app when the user is not logged in"](https://github.com/hajinasiri/jungle-rails/blob/master/docs/Screen%20Shot%202017-09-02%20at%205.27.17%20PM.png?raw=true)
- !["Login page"](https://github.com/hajinasiri/jungle-rails/blob/master/docs/Screen%20Shot%202017-09-02%20at%205.27.57%20PM.png?raw=true)
- !["Login page"]()
## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Put Stripe (test) keys into appropriate .env vars
5. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

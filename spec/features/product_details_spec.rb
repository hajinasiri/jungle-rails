require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'First User',
      last_name: 'Last name',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )

    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: 'Cool Shirt',
      description: 'A really cool shirt.',
      image: 'test.jpg',
      quantity: 3,
      price: 12.99
    )
  end

  scenario "They complete an order while logged in" do
    visit '/login'

    within 'form' do
      fill_in id: 'session_email', with: 'first@user.com'
      fill_in id: 'session_password', with: '123456'
      click_button class: 'btn btn-primary'
    end
    visit root_path
    add_product_and_checkout
    expect(page).to have_content 'Thank you for your order!'
  end

  scenario "They complete an order while not logged in" do
    visit root_path

    add_product_and_checkout

    expect(page).to have_content 'Thank you for your order!'
  end


  def add_product_and_checkout
    first('article.product').find_link('Add').click
    visit '/cart'
    first('button.stripe-button-el').click

    within_frame 'stripe_checkout_app' do
      fill_in placeholder: 'Card number', with: '4242424242424242'
      fill_in placeholder: 'MM / YY', with: "01/#{Date.today.year + 1}"
      fill_in placeholder: 'CVC', with: '123'
      save_screenshot 'pay.png'

      click_button 'Pay'
    end
  end
end

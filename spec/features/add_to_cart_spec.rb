# To run test, type in command line: bin/rspec spec/features/add_to_cart_spec.rb --format documentation
# Screenshots stored in tmp/capybara/ once test run

require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click add on an item and it is added to the cart" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # ACT
    click_button('Add', match: :first)

    sleep 2

    # DEBUG
    save_screenshot

    # VERIFY
    #We expect to find 'My Cart (1)' after item is added. 
    expect(page).to have_text 'My Cart (1)'

  end

  
end

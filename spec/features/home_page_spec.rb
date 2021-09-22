# To run test, type in command line: bin/rspec spec/features/home_page_spec.rb --format documentation
# Screenshots stored in tmp/capybara/ once test run
# MUST ADD js:true TO ALL FEATURES TESTS

require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # VERIFY
    #We expect to find 10 as we created 10 above. if change count #, test will fail
    expect(page).to have_css 'article.product', count: 10 
  end

end
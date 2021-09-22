# To run test, type in command line: bin/rspec spec/features/product_details_spec.rb --format documentation
# Screenshots stored in tmp/capybara/ once test run
# MUST ADD js:true TO ALL FEATURES TESTS

require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do
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

  scenario "They can click product and go to product details" do
    # ACT

    visit root_path

    # DEBUG
    save_screenshot
 
    # puts "before #{page}"
    
    # puts page.html
     
    # ACT
    find(:link, href: '/products/2', class: 'btn btn-default pull-right').click

    # Sleep for 2 seconds to allow screenshot to take picture
    sleep 2
   

    # puts "after #{page}" 

    # DEBUG
    save_screenshot

    # VERIFY
    #We expect to check if there is 'product-detail' anywhere in css
    expect(page).to have_css 'article.product-detail'
  end


end


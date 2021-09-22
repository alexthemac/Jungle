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

  # scenario "They see all products" do
  #   # ACT
  #   visit root_path

  #   # DEBUG
  #   save_screenshot

  #   # VERIFY
  #   #We expect to find 10 as we created 10 above. if change count #, test will fail
  #   expect(page).to have_css 'article.product', count: 10 
  # end

  scenario "They can click product and go to product details" do
    # ACT

    visit root_path

    save_screenshot
 
    # puts "before #{page}" 

    # click_on "/products/1"

    # page.find :button, 'Details'.click

    # find(href="/products/2").click

    # click_on('/products/2')
   

    # find_link("Details").first.click

    # puts page.html
   
    
    # find_link("Details", match: :first).click

    # find("Details", match: :first).click
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


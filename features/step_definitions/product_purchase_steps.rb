Given(/^there are products for purchase$/) do
  @product = FactoryGirl.create :product
end

Given(/^I choose buy now$/) do
  visit '/'
  click_link 'Buy Now'
end

Given(/^I am on the product detail page$/) do
  visit '/'
  click_link 'Buy Now'  
end

Given(/^I give my name$/) do
  fill_in('Name', :with => 'Johnny Racer')
end

Given(/^I purchase now$/) do
  click_button('Purchase now')
end

Then(/^I should see a checkout form$/) do
  page.has_content?('Your Order Details')
end

Then(/^the system should generate a mission file$/) do
  page.should have_content('A mission file has been generated')
end
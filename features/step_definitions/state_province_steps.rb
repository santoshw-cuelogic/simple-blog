Given(/^list of countries$/) do
  currency = Fabricate(:valid_currency)
  country =  Country.create!(:name=>"United States Of America",:country_cd2=>"US",:country_cd3=>"Usd",:currency => currency) 
  country =  Country.create!(:name=>"South Africa",:country_cd2=>"SA",:country_cd3=>"SAe",:currency => currency) 
  country =  Country.create!(:name=>"India",:country_cd2=>"In",:country_cd3=>"Ind",:currency => currency) 
end

Given(/^I click on "(.*?)" link$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)" span has updated value "(.*?)"$/) do |selector, value|
  element ||= find('span', :text => selector)
  element.click
end

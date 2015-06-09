Given(/^a Borrower and I am on "(.*?)" page$/) do |page_name|
  visit edit_borrower_path( Fabricate(:borrower) )
end

Given(/^list of state_provinces$/) do
  currency = Fabricate(:valid_currency)
  country =  Country.create!(:name=>"England",:country_cd2=>"ES",:country_cd3=>"ESD",:currency => currency) 
  Fabricate(:state_province, code: "PS", name: "Peters Berg", country: country )
  Fabricate(:state_province, code: "FL", name: "Florida", country: country ) 
end

Then(/^I select  "(.*?)" from "(.*?)"$/) do |value, field|
  select(value, :from => field)
end

Then(/^I should see "(.*?)" link$/) do |class_name|
  find("a.#{class_name}").click
end

Then(/^I click on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm deletion$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should see Database count is (\d+)$/) do |count|
  MailAddress.count.should eq count.to_i
end
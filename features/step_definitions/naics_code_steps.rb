When(/^I fill in "(.*?)" with (\d+)$/) do |field, value|
  fill_in(field, :with => value)
end

Given(/^a Borrower with the association with a NAICS Code$/) do
  Fabricate(:borrower, naics_code: Fabricate(:naics_code))
end

When(/^I select a row "(.*?)" in the grid$/) do |grid_container|
  within(grid_container) do
  find(".input").attr('checked', 'checked')
  end
end


Given(/^a Borrower and I am on charge_templates page$/) do
  visit borrower_charge_templates_path( Fabricate(:borrower) )
end
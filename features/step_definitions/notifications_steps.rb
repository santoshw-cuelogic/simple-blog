Then /^(?:|I )should see "([^"]*)" within element "([^"]*)"$/ do |text, selector|
  actual = page.evaluate_script("$('#{selector}').text()")
  assert_equal text, actual
end

Then /^(?:|I )should see "([^"]*)" new "([^"]*)" notification\(s\)$/ do |count, type|
element_id = "span#notify-#{type}-count"
  actual = page.evaluate_script("$('#{element_id}').text()")
  assert_equal count, actual
end

Then /^(?:|I )should see (\d+) "([^"]*)" message\(s\)$/ do |count, type|
  element_id = "##{type}-content"
  actual = page.evaluate_script("$('#{element_id}').children().length")
  assert_equal count.to_i, actual
end
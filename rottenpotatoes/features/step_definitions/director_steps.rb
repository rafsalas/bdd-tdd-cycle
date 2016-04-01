Given(/^the following movies exist:$/) do |table|
  table.hashes.each do |movie|
    Movie.create(:title => movie['title'], :rating => movie['rating'], :director => movie['director'], :release_date => movie['release_date'])
  end
end

When(/^I go to the edit page for "(.*?)"$/) do |arg1|
  
  
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the details page for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I follow "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the Similar Movies page for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the home page$/) do
  pending # express the regexp above with the code you wish you had
end
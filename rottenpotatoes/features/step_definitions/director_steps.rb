Given(/^the following movies exist:$/) do |table|
  table.hashes.each do |movie|
    Movie.create(:title => movie['title'], :rating => movie['rating'], :director => movie['director'], :release_date => movie['release_date'])
  end
end


When(/^fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  m = Movie.find_by_title(arg1)
  m.director.should == arg2
  
end

#Given(/^the details page for "(.*?)"$/) do |arg1|
#  visit path_to()
#end

When(/^follow "(.*?)"$/) do |arg1|
  click_link(arg1)
end

Then(/^the Similar Movies page for "(.*?)"$/) do |director|
  current_path.should == path_to(director)
end

Then(/^should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^should not see "(.*?)"$/) do |arg1|
  page.should have_no_content(arg1)
end

Then(/^be on the home page$/) do
  current_path.should == movies_path
end
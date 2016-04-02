Given /^the (.*) page is loaded$/ do |var|
    visit "/welcome/" + var
end

When /^the (.*) button is clicked$/ do |button|
    click_button button
end

Then /^the (.*) title is displayed$/ do |var|
    page.should have_css('.main-title', :text => var) 
end

When /^(.*) is filled in with (.*)$/ do |box, input|
   page.fill_in(box, :with => input)
end

When /^I check (.*)$/ do |box|
   page.check(box) 
end

When /^I uncheck (.*)$/ do |box|
   page.uncheck(box) 
end

Then /^(.*) contains (.*)$/ do |box, input|
   page.find_field(box).value.should eq input
end

Then /^(.*) does not contain (.*)$/ do |box, input|
    page.find_field(box).value.should_not eq input
end

Then /^(.*) is checked$/ do |box|
    find_field(box).should be_checked
end

Then /^(.*) is unchecked$/ do |box|
    find_field(box).should_not be_checked
end
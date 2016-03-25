Given /^the (.*) page is loaded$/ do |var|
    visit "/welcome/" + var
end

When /^the (.*) button is clicked$/ do |button|
    click_button button
end

Then /^the (.*) title is displayed$/ do |var|
    page.should have_css('.main-title', :text => var) 
end
Given(/^there is (\d+) experience field$/) do |arg1|
    experiences_table = find_by_id ("experiences") 
    nof_experiences = experiences_table.all("tr").size - 1
    nof_experiences.should eq 1
end

Then(/^there should be (\d+) experience fields showing$/) do |arg1|
    experiences_table = find_by_id ("experiences")
    nof_experiences = experiences_table.all("tr").size - 1
    nof_experiences.should eq 2
end

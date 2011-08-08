Given /^I have no employees$/ do
  Employee.delete_all
end

Given /^I (only )?have employees titled "?([^\"]*)"?$/ do |only, titles|
  Employee.delete_all if only
  titles.split(', ').each do |title|
    Employee.create(:name => title)
  end
end

Then /^I should have ([0-9]+) employees?$/ do |count|
  Employee.count.should == count.to_i
end

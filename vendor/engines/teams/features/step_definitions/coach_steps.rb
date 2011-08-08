Given /^I have no coaches$/ do
  Coach.delete_all
end

Given /^I (only )?have coaches titled "?([^\"]*)"?$/ do |only, titles|
  Coach.delete_all if only
  titles.split(', ').each do |title|
    Coach.create(:name => title)
  end
end

Then /^I should have ([0-9]+) coaches?$/ do |count|
  Coach.count.should == count.to_i
end

# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  n = 1
  movies_table.hashes.each do |movie|    
    instance_variable_set("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}", Movie.new)
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").title = movie[:title]
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").rating = movie[:rating]
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").release_date = movie[:release_date]
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").id = n
    n += 1
  end
  
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  @selected_ratings ||= Hash.new
  if uncheck 
    @selected_ratings[rating_list] = false
  else
    @selected_ratings[rating_list] = true
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  flunk "Unimplemented"
end


When(/^I press the "(.*?)" button$/) do |submit|
  #debugger
  click_button(submit)

end

Then(/^I should see movie number "(.*?)"$/) do |movie_id|
  puts @selected_ratings.inspect
  movies_table.hashes.each do |movie|    
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").should have_id(movie_id)
    
   
  end


end

Then(/^I should not see movie mumbers "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg2, arg3, arg4, arg5, arg6|
  pending # express the regexp above with the code you wish you had
end


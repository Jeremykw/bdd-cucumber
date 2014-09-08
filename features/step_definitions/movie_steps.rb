
# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  id_num = 1
  movies_table.hashes.each do |movie|
    Movie.create do |add_movie|
      add_movie.title = movie[:title]
      add_movie.rating = movie[:rating]
      add_movie.release_date = movie[:release_date]
      add_movie.id = id_num
    end
  id_num += 1
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
  rating_list.split(",").each do |rating|
    ratings = "ratings[#{rating.strip}]"
    if uncheck 
      step %{I uncheck "#{ratings}"}
    else
      step %{I check "#{ratings}"}
    end
    puts rating.inspect
  end
  puts controller.selected_ratings.inspect
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  flunk "Unimplemented"
end


When(/^I press the "(.*?)" button$/) do |submit|
  #debugger
  click_button(submit)
  puts @selected_ratings.inspect
end

Then(/^I should see movie number "(.*?)"$/) do |movie_id|
  puts @selected_ratings.inspect
  ratings = @selected_ratings.find_all{|k,v| k == true }
  movie = Movie.find_by_rating(ratings)
  puts ratings.inspect
=begin  
  movies_table.hashes.each do |movie|    
    instance_variable_get("@#{movie[:title].gsub(/[^a-zA-Z]/, "").downcase}").should have_id(movie_id)
  
  end
=end 

end

Then(/^I should not see movie mumbers "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg2, arg3, arg4, arg5, arg6|
  pending # express the regexp above with the code you wish you had
end


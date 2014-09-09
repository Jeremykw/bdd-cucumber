
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
  rating_list.split.each do |r| 
    r.delete(" ", ",").strip
    rating = "ratings[#{r}]"
    if uncheck 
      uncheck(rating)
    else
      check(rating)
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  flunk "Unimplemented"
end

When(/^I press the "(.*?)" button$/) do |submit|
  click_button(submit)
end

Then /^I should see movie number: (.*)/ do |movie_id|
  movie_list = Movie.where({rating: ["PG", "R"]}).count.should == 5
end

Then /^I should not see movie number: (.*?)/ do |movie_id|
  movie_list = Movie.where({rating: ["PG-13", "NC-17", "G"]}).count.should == 5
end

Then(/^I should see all movies$/) do
  movie_list = Movie.where({rating: ["PG", "R", "PG-13", "NC-17", "G"]}).count.should == 10
end


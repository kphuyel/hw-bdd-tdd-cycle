# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
      Movie.create(movie)
  end

end


Then /^the director of "(.*?)" should be "(.*?)"$/ do |movie_title, new_director|
  movie = Movie.find_by_title movie_title
  movie.director.should == new_director
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  aString = page.body.to_s 
       if aString.index(e1)!= nil && aString.index(e2) !=nil
               if aString.index(e1) > aString.index(e2)
                   assert false,”jr_fail”
               end
       else
         assert false,”jr_fail”
       end
end

Then /^"([^"]*)" selected "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    field_labeled(field).find(:xpath, ".//option[@selected = 'selected'][text() = '#{value}']").should be_present
  end
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

  rating_list.split(',').each do |rating|
    if uncheck
      uncheck "ratings_#{rating}"
    else
      check "ratings_#{rating}"
    end
  end
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  movies = Movie.all
  movies.each do |movie |
    page.should have_content(movie.title)
  end
  #fail "Unimplemented"
end
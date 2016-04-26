Feature: create delete movies 
 
  As a movie buff
  So that I can add and delete movies 
  I want to add and delete movies
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |


# Scenario: add director to existing movie
#   When I go to the edit page for "Alien"
#   And  I fill in "Director" with "Ridley Scott"
#   And  I press "Update Movie Info"
#   Then the director of "Alien" should be "Ridley Scott"
Scenario: add movie 
  Given I am on new movie page
 #When I go to new movie page
  And  I fill in "Title" with "Life of Pi"
  And  I fill in "Director" with "Ang Lee"
  #And  I check "Rating" with "G"
 # And  I fill in "Release Date" with "2012-11-23"
  And  I press "Save Changes"
  #Then  I should be on details page for "Life of Pi"
  #And   I should see "Life of Pi"
 
Scenario: destroy movie
  Given I am on the details page for "Alien"
  When  I press "Delete"
  Then  I should be on the home page
  #And  I should not see "Alien"
  #Then   I should not see "Alien"

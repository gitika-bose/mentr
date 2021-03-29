Feature: users can become mentors and update mentor info

  I am a user that would like to become a mentor. However,
  this involves a lot of complicated communication to get
  approved, and I want an easier way to sign up.
  
Background: a few mentors and mentees are using the site
  Given the following users exists

    | username | email                   | password            |
    | bob      | bob@mentr.me            | bob1876             |
    | bil      | bil@mentr.me            | PoPcornHorse        |
    | eric     | eric@mentr.me           | 12334567772         |
    | john     | john23@mentr.me         | QWERTY              |
    | dillen   | dillen@mentr.me         | PassWord            |

  And I am on the catalog page
  Then 5 seed users should exist

Scenario: user can become mentor
  When I login
  And I click become mentor
  And I add mentor info
  And I click sign up as mentor button
  And I click catalog
  And I search for bob
  And I click search
  And I click more info
  Then I should find tutor results

Scenario: user can update mentor data
  When I login
  And I click become mentor
  And I add mentor info
  And I click sign up as mentor button
  And I click update mentor
  And I add mentor info
  And I click save mentor button
  And I click catalog
  And I search for bob
  Then I should find tutor results

Scenario: user can delete mentor data
  When I login
  And I click become mentor
  And I add mentor info
  And I click sign up as mentor button
  And I click update mentor
  And I click quit mentor button
  And I click catalog
  And I search for bob
  Then I should not find tutor results
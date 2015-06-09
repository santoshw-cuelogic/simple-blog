@functional

Feature: articles
  In order to create and maintain master data that are used across multiple Article.
  As a Editor

  Scenario: C000 Should able to view number of articles
    Given the following articles:
      | subject      | description | status | posted_at  |
      | sub1         | mzr         | true   | 2015-06-09 |
      | sub2         | mzr         | false  | 2015-06-09 |

    And I should see 2 articles in the database
    Given I am on the articles page
    And I wait for "2" seconds

  Scenario: C000 Create a new Article with valid data
    Given I am on the articles page
    When clicked on "new_article" link
    And I fill in "article_subject" with "aaaa"
    And I fill in "article_description" with "sdsdsd"
    And I fill in "article_status" with "0"
    And I fill in "article_posted_at" with "2015-06-09"
    When I press "save_article"
    And I wait for "2" seconds
    Then I should see "Article was successfully created."

  Scenario: C000 Create a new Article with invalid data for lengths(M)
    Given I am on the articles page
    When clicked on "new_article" link
    And I fill in "article_subject" with "xxxyyyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And I fill in "article_description" with "aaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaa"
    And I fill in "article_status" with "0"
    And I fill in "article_posted_at" with "2015-06-09"
    When I press "save_article"
    And I wait for "2" seconds
    Then I should see "Subject is too long (maximum is 100 characters)"

  Scenario: C000 Edit a article with valid parameter(M)
    Given the following articles:
      | subject      | description | status | posted_at  |
      | sub1         | mzr         | true   | 2015-06-09 |
      | sub2         | mzr         | false  | 2015-06-09 |

    And I should see 2 articles in the database
    Given I am on the articles page
    And I wait for "2" seconds
    Given I am on the articles page
    And clicked on "edit_article_0" link
    And I fill in "article_subject" with "abc-12"
    And I fill in "article_development" with "xyz-A26"
    When I press "save_article"
    And I wait for "2" seconds
    Then I should see "Article was successfully updated."



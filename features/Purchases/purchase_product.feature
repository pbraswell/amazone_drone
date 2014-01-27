Feature:
  In order to have a Matchbox car delivered to my house by a drone
  As a customer
  I want to be able to order a product and have the system calculate my location as a landing zone for delivery

Scenario: Select a product
  Given there are products for purchase
  And I choose buy now 
  Then I should see a checkout form 

Scenario: Purchase a product
  Given there are products for purchase
  And I am on the product detail page
  And I give my name 
  And I purchase now 
  Then the system should generate a mission file
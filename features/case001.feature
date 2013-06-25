# encoding: utf-8
Feature: Test case001 Create V2V non activity - Submit
  In Order to submit V2V as on case001
  As a VAA user
  I want create V2V correctly

  # TODO Put detail of this scenario here ----- Shumnan 201306191353
  # TODO Re-correct Extension .rb >> .feature when execute ----- Shumnan 201306191353
  # TODO Need to put Test practical data here ----- Shumnan 201306191353
  # TODO Need to memorize input data to validate th result of parse same parameter in this later.
#  |  division |  suffixPath |
#  |  vaa |  /vaa/www |

  Background:
  Given I have logged in as "vaa" user at "/vaa/www"
  And I am on "Create V2V Shipment VAA to VAA" page

  Scenario: Create V2V non activity
    When click tab link  at "VAAOutbound"
    And click "Create VAA to VAA" button
    And fill "correct" V2V info:
    | shipmentType  | declarationNo  |
    | ???????????????????  | VD12560600001  |
    And click "Get Information" button
    And select dropdown box of "destination" of V2V with "F0101111340004"
    And click "Submit" button
    And click tab link at "VAAOutbound"
    And fill "correct" V2V info:
    | shipmentType  | declarationNo  |
    | ???????????????????  | VD12560600001  |
    And click "Search" button
    Then VAA Table display "correct" V2V info:
    | shipmentType  | declarationNo  |
    | ???????????????????  | VD12560600001  |

  Scenario: Display creating duplicate V2V non activity
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "correct" V2V info:
    | shipmentType  | declarationNo  |
    | ???????????????????  | VD12560600001  |
    And click "Get Information" button
    And select dropdown box of "destination" of V2V with "F0101111340004"
    And click "Submit" button
    Then display Warning "????????????????????????????"

    Scenario: Display error V2V from incorrect shipment type
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "incorrectshipmentType" V2V info:
    | Index | Shipment Type  | Declaration No  |
    | 0 | ???????????????????  | VD12560600001  |
    And click "Get Information" button
    Then display Warning "???????????????????"

    Scenario:  Display error V2V from incorrect status
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "incorrectStatus" V2V info:
    | Index | Shipment Type  | Declaration No  |
    | 0 | ???????????????????  | DV12560600008  |
    And click "Get Information" button
    Then display Warning "???????????????????"

    Scenario: Display error V2V from incorrect activity
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "incorrectActivity" V2V info:
    | Index | shipmentType  | declarationNo  |
    | 0 | ??????????????????? | DV07560600001  |
    And click "Get Information" button
    Then display Warning "???????????????????"


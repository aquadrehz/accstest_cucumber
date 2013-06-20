# encoding: utf-8
Feature: Test case001 Create V2V non activity - Submit
  In Order to submit V2V as on case001
  As a VAA user
  I want create V2V correctly
  
  # TODO Put detail of this scenario here ----- Shumnan 201306191353
  # TODO Re-correct Extension .rb >> .feature when execute ----- Shumnan 201306191353
  # TODO Need to put Test practical data here ----- Shumnan 201306191353
  # TODO Need to memorize input data to validate th result of parse same parameter in this later.

  Background:
  # Base URL (http://localhost/accs/ or else) was stripped before place in below action.
  Given I have logged in as "division" user at "suffixPath"
  |  division |  suffixPath |
  |  vaa |  /vaa/www |
  And I am on "Create V2V Shipment VAA to VAA" page
 
  Scenario: Create V2V non activity 
    When click tab link  at "VAAOutbound"
    And click "Create VAA to VAA" button
    And fill "correct" V2V info
    | ColumnA1  | ColumnB1  | ColumnC1  |
    | RowA1  | RowB1  | RowC1  |
    And click "Get Information" button
    And choose "destination"
    And click "Submit" button
    And click tab link at "VAAOutbound"
    And fill "correct" V2V info
    | ColumnA1  | ColumnB1  | ColumnC1  |
    | RowA1  | RowB1  | RowC1  |
    And click "Search" button
    Then 
    Then VAA Table dispaly "correct" V2V info
    | ColumnA1  | ColumnB1  | ColumnC1  |
    | RowA1  | RowB1  | RowC1  |

  Scenario: Display creating duplicate V2V non activity
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "correct" V2V info
    | ColumnA1  | ColumnB1  | ColumnC1  |
    | RowA1  | RowB1  | RowC1  |
    And click "Get Information" button
    And choose "destination"
    And click "Submit" button
    Then display Warning "รายการนี้ถูกสร้างคำร้องฯแล้ว"
    
    Scenario : Display error V2V from incorrect shipment type
    When click tab link at "VAA Outbound" 
    And click "Create VAA to VAA" button
    And fill "incorrectShipmentType"  V2V info
    | ColumnA2  | ColumnB2  | ColumnC2  |
    | RowA2  | RowB2  | RowC2  |
    And click "Get Information" button
    Then display Warning "ไม่พบรายการที่ค้นหา"
    
    Scenario  Display error V2V from incorrect shipment type
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "incorrectStatus" V2V info
    | ColumnA3  | ColumnB3  | ColumnC3  |
    | RowA3  | RowB3  | RowC3  |
    And click "Get Information" button
    Then display Warning "ไม่พบรายการที่ค้นหา"
    
    Scenario Display error V2V from incorrect shipment type
    When click tab link at "VAA Outbound"
    And click "Create VAA to VAA" button
    And fill "incorrectActivity" V2V info
    | ColumnA4  | ColumnB4  | ColumnC4  |
    | RowA4 | RowB4  | RowC4  |
    And click "Get Information" button
    Then display Warning "ไม่พบรายการที่ค้นหา"


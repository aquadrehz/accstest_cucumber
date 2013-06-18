# encoding: utf-8
Feature: Test case001 Create V2V non activity - Submit
  In Order to submit V2V as on case001
  As a VAA user
  I want create V2V correctly
  
  # TODO Put the detail of this scenario here
  # TODO Re-correct Extension .rb >> .feature
  # TODO need to use Example set in error case

  
  Scenario: Create V2V non activity 
    Given the I am on Create Request Shipment VAA to VAA page
    When click Outbound -> VAA Outbound button
    And click Create VAA to VAA button
    And fill request info
    And click the Get Information button
    And choose destination
    Then V2V is inserted to database

  Scenario: Display creating duplicate V2V non activity
    Given the I am on Create Request Shipment VAA to VAA page
    When click Outbound -> VAA Outbound button
    And click the Create VAA to VAA button
    And fill request info
    And click the Get Information button
    And choose destination
    Then display รายการนี้ถูกสร้างคำร้องฯแล้ว
    
  Scenario: Display error request from incorrect shipment type
    Given the I am on Create Request Shipment VAA to VAA page
    When click Outbound -> VAA Outbound button
    And click the Create VAA to VAA button
    And fill request info
    And click the Get Information button
    Then display ไม่พบรายการที่ค้นหา
    
  Scenario: Display error request from incorrect status
    Given the I am on Create Request Shipment VAA to VAA page
    When click Outbound -> VAA Outbound button
    And click the Create VAA to VAA button
    And fill request info
    And click the Get Information button
    Then display ไม่พบรายการที่ค้นหา
    
  Scenario: Display error request from incorrect activity
    Given the I am on Create Request Shipment VAA to VAA page
    When click Outbound -> VAA Outbound button
    And click the Create VAA to VAA button
    And fill request info
    And click the Get Information button
    Then display ไม่พบรายการที่ค้นหา


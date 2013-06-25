# encoding: utf-8
Feature: Test case002

  Background:
    Given I have logged in as "vaa" user at "/vaa/www/monitor/index/"

  Scenario: Open monitor
    When open site at "/vaa/www/monitor/index/"
    And click button

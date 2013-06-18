Cucumber
========

##Cucumber Project Directory

* bin
* features
	** XXX.feature
	** ...
* step_definitions
    ** XXX_steps.rb
    ** ...
* support
    ** env.rb
* lib
* spec

## Feature file outline (XXX.feature)

* Feature: [the features name]
	In order to [goal]
	As a [role]
	I want to [action]

* Background: 
	Given [some statement]
	And [some action]
	...

* Scenario Outline: [name of the scenario]
	Given [some statement]
	And [some action]
	...
	When [some action]
	And [some action]
	...
	Then [expected result of the action on the system]
	And [another expectation]
	Examples: [name of example set]
	| column A | column B | column C |
	| row 1 A  | row 1 B  | row 1 C  |
	| row 2 A  | row 2 B  | row 1 C  |
	...
	
	
Note: You can include multiple Example tables if you like.

* Cucumber uses the features/support/env.rb file to set up cucumber.
	Before do  |scenario|
	...
	end

	After do
	...
	end

Reference: [MD file syntax](https://github.com/fletcher/MultiMarkdown/blob/master/Documentation/Markdown%20Syntax.md)
Reference: [cucumber structure](http://www.nigelthorne.com/2009/04/cucumber-syntax.html)
Reference: [Cucumber nest practice](http://qastrategies.blogspot.com/2012/06/cucumber-best-practises.html)
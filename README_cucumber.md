Cucumber
========

##Cucumber Project Structure

* bin
* features
	* XXX.feature
	* ...
* step_definitions
    * XXX_steps.rb
    * ...
* support
    * env.rb
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
	And [some action] <Column A> <Column B>  
	...   
	When [some action]   
	And [some action] <Column C>   
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
Note: Doc Strings (""")
	Doc strings just allow you to specify a larger piece of text than you could fit on a single line.   
	For example, if you need to describe the precise content of an email message, you could do it like this:   
	Then I should receive an email containing:-   
	"""   
	Dear Sir,   
	Your account has been upgraded due to your 2 year membership.   
	Sincerely,   
	The Management   
	"""   
Note: Parse parameter as table
	When I fill in the form with the following table:
  	| Order Name | Date       | Client  | Price |
  	| Test1      | 2012-02-12 | John B. | 200$  |
  	
Reference: [MD file syntax](https://github.com/fletcher/MultiMarkdown/blob/master/Documentation/Markdown%20Syntax.md)   
Reference: [cucumber structure](http://www.nigelthorne.com/2009/04/cucumber-syntax.html)   
Reference: [Cucumber best practice](http://qastrategies.blogspot.com/2012/06/cucumber-best-practises.html)   
Reference: [Official Cucumber Overall](https://github.com/cucumber/cucumber/wiki/Cucumber-Backgrounder)

Cucumber Implementation step
========


1. Create cucumber project following on _Cucumber Project Structure_ (Check upper section.)
2. Create feature file following on _Feature file outline (XXX.feature)_ (Check upper section.)
3. Create step file by execute command: cucumber >./feature/step_definitions/XXX_step.rb
4. Remove unused text in XXX_step.rb until left as below.
	Given    
	And [some action]   
```` ruby
# encoding: utf-8
Given(/^     [some statement]     $/) do
  pending # express the regexp above with the code you wish you had
end
...

When(/^     [some action]     $/) do
  pending # express the regexp above with the code you wish you had
end
...

````

5. Add Before, After and Then step.

6. Add  require  and another ruby command. The result step file displayed below.
``` ruby
# encoding: utf-8
require '[XXX]'

Before do
  [ruby command]
end

After do
  [ruby command]
end
 
Given(/^     [some statement]     $/) do
  [ruby command]
end
...

When(/^     [some action]     $/) do
  [ruby command]
end
...

When(/^     [some expectation]     $/) do
  [ruby command]
end
...

```

7. Add some ruby operation statement in all step. This step is core function of the cucumber.
8. Repeat step 3 - 4 until complete all test case.
9. Validate and fix tested application until all scenario passed when execute command: cucumber
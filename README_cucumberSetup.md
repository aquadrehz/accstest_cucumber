#ACCSTEST_CUCUMBER
========
ACCSTEST is a project which is designed for testing ACCS, including web and web services.

##Requirements

###Installed via installer or else

* Ruby 1.9.3 (32-bit)[rubyinstaller-1.9.3-p429.exe]
* Ruby DevKit 1.9.3(32-bit) [DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe]
* MySQL Connector/C 6.1.0(32-bit) [mysql-connector-c-6.1.0-win32.msi]
* Firefox 21.1
* Selenium IDE for Firefox 2.0.0

###Installed via Gem

* MySQL22 0.3.11 x86-mingw32
* Selenium-WebDriver 2.33.0
* **Cucumber 1.3.2**
* Rails 4.0.0.rc2
* <Other depended library>


##Installation Instructions

###MS Windows

1.	Install Ruby 1.9.3 with RubyInstaller from [here](http://rubyinstaller.org).
	Then you must install DevKit from the web site to compile some gems.
	To install Ruby 1.9.3 DevKit you should following their instructions, [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit). 
2.	Install MySQL Connector/C from MySQL Developer web site, [here](http://dev.mysql.com/downloads/),
	please install 32bit version as same as DevKit. recommended version displayed in Requirement Topic.
3.	Install MySQL2 via:

		**gem install mysql2 -- --with-mysql-dir={mysql_installed_dir} --with-mysql-lib={mysql_installed_dir}/lib**

4.	Copy libmysql.dll from **{mysql_installed_dir}/lib** to **{ruby_installed_dir}/bin.**
5.	Test your mysql2 with command:

		irb -r "mysql2"
		
		db = Mysql2::Client.new({
			:username => 'root',
			:password => '',
			:database => 'mysql'
		})
		res = db.query('select * from user')
		res.to_a
	
	Expected Result:
	=> [{"Host"=>"localhost", "User"=>"root", "Password"=>"", ...
6.	[Optional] If it shows version mismatch, fix follow below instruction.
6.1	Download HexEdit 
6.2	Open libmysql.dll (in ruby_installed_dir) 
6.3	Replace from 6.1.0 into 6.0.0

7.	Install Selenium WebDriver via:

		gem install selenium-webdriver

8.	Install cucumber via:

		gem install cucumber

9.	Install Rails 4 via:

		gem install rails --pre

10.	Check installed gem via cmd by execute command: gem list
11.	Download and install Firefox from [here](http://www.mozilla.org/en-US/firefox/new/).
12.	Install Selenium IDE for Firefox from Selenium website, [here](http://docs.seleniumhq.org/download/)

###MacOSX (Mountain Lion)

1.	Install Xcode from Apple website, [here](http://developer.apple.com/xcode/).
2.	Install Command Line Tools (OS X Mountain Lion) for Xcode from their developer website.
3.	Install OpenSSL from OpenSSL website, [here](http://www.openssl.org/source/). Then, compile and install it.
4.	Download Ruby souce code from Ruby website, [here](http://www.ruby-lang.org/en/downloads/). Then, configure ruby with:

		./configure --with-openssl-dir=/usr/local/ssl/

5.	Compile and install Ruby from previous step.
6.	Install MySQL Community Server which you can download it from [here](http://dev.mysql.com/downloads/)
7.	Install MySQL2 via:

		gem install mysql2 -- --with-mysql-config={mysql_installed_dir}}/bin/mysql_config

8.	Install Selenium WebDriver via:

		gem install selenium-webdriver

9.	Install cucumber via:

		gem install cucumber

10.	Install Rails 4 via:

		gem install rails --pre

11.	Check installed gem via cmd by execute command: gem list
12.	Download and install Firefox from [here](http://www.mozilla.org/en-US/firefox/new/).
13.	Install Selenium IDE for Firefox from Selenium website, [here](http://docs.seleniumhq.org/download/)

##Code for Test Selenium WebDriver

```ruby
require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "Cheese!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit
```

##Procedure for Test cucumber

1. Clone cucumber repository from [here](https://github.com/cucumber/cucumber.git)
2. Access path cucumber/cucumber/examples
3. Access following directory [cucumber/examples/i18n/en-lol/](https://github.com/cucumber/cucumber/tree/master/examples/i18n/en-lol).
4. Execute command: cucumber
5. Expected Result displayed below.

``` ruby
*** WARNING: You must use ANSICON 1.31 or higher (https://github.com/adoxa/ansicon/) to get coloured output on Windows
# language: en-lol
OH HAI: STUFFING

  MISHUN: CUCUMBR                        # features\stuffing.feature:4
    I CAN HAZ IN TEH BEGINNIN 3 CUCUMBRZ # features/step_definitions/cucumbrz_steps.rb:1
    WEN I EAT 2 CUCUMBRZ                 # features/step_definitions/cucumbrz_steps.rb:5
    DEN I HAS 2 CUCUMBERZ IN MAH BELLY   # features/step_definitions/cucumbrz_steps.rb:10
    AN IN TEH END 1 CUCUMBRZ KTHXBAI     # features/step_definitions/cucumbrz_steps.rb:14

1 scenario (1 passed)
4 steps (4 passed)
0m0.009s
```

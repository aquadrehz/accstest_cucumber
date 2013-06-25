# Created ----- Charoensak 201306191217

require 'singleton'
require 'logger'


class Environment
	include Singleton

	attr_accessor :logger

	def initialize()
		@options = { 
			:db => Hash.new, 
			:selenium => Hash.new,
			:authorization => Hash.new
		}
		@logger = Logger.new(STDOUT)
		@logger.level = Logger::ERROR

    load_options 'remoteConfig.avc.rb'
    load_options 'localConfig.avc.rb'


		if @options[:db].empty?
			raise ':db options cannot be null'
		else
			raise ':db[:adapter] option cannot be null' if @options[:db][:adapter].nil? or @options[:db][:adapter].empty?
			raise ':db[:host] option cannot be null' if @options[:db][:host].nil? or @options[:db][:host].empty?
			raise ':db[:username] option cannot be null' if @options[:db][:username].nil? or @options[:db][:username].empty?
			raise ':db[:password] option cannot be null' if @options[:db][:password].nil? or @options[:db][:password].empty?
		end

		if @options[:selenium].empty?
			raise ':selenium options cannot be null'
		else
			raise ':selenium[:driver] option cannot be null' if @options[:selenium][:driver].nil? or @options[:selenium][:driver].empty?
			raise ':selenium[:base_url] option cannot be null' if @options[:selenium][:base_url].nil? or @options[:selenium][:base_url].empty?
		end
	end

# Created ----- Charoensak 201306191217
	def load_options(filename)
		@logger.info "load options from #{filename}"
		begin
			options = eval(File.open(filename, 'r') { |file| file.read })
			@logger.debug "options = #{options}"
			unless options.nil?
				unless options[:db].nil?
					@options[:db].merge! options[:db]
				end
				unless options[:selenium].nil?
					@options[:selenium].merge! options[:selenium]
				end
				if !options[:logger].nil? and !options[:logger][:level].nil?
					@logger.info "set logger level to #{options[:logger][:level]}"
					@logger.level = eval("Logger::#{options[:logger][:level]}")
				end
				unless options[:authorization].nil?
					@options[:authorization].merge! options[:authorization]
				end
			end
		rescue => err
			@logger.warn err
		end
end

# Created ----- Charoensak 201306191217
	def db_spec(dbname)
		@db_spec_cache = Hash.new if @db_spec_cache.nil?

		if @db_spec_cache[dbname].nil?
			spec = @options[:db]
			spec_cache = spec.merge({ :database => dbname })

			@logger.debug "@db_spec_cache[#{dbname}] = #{spec_cache}"

			@db_spec_cache[dbname] = spec_cache
		else
			@logger.debug "@db_spec_cache[#{dbname}] = #{@db_spec_cache[dbname]}"
			@db_spec_cache[dbname]
		end
end

# Created ----- Charoensak 201306191217
	def selenium_spec()
		@options[:selenium]
end

# Created ----- Charoensak 201306191217
	def authorization_spec(site)
		case site
		when 'cms', :cms
			site = :cms
		when 'vaa', :vaa
			site = :vaa
		when 'oga', :oga
			site = :oga
		when 'tmo', :tmo
			site = :tmo
		end

		@logger.debug  "@options[:authorization][:#{site}] = #{@options[:authorization][site]}"

		if @options[:authorization][site].nil?
			{ :username => 'userName', :password => 'password' }
		else
			@options[:authorization][site]
		end
	end

end
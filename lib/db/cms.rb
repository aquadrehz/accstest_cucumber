# Created ----- Charoensak 201306191217

require 'active_record'

module DB
	module CMS
		class CMSBaseDB < ActiveRecord::Base
			self.abstract_class = true

			CMSBaseDB.establish_connection(
				adapter: Environment.instance.db_spec('accscms')[:adapter],
				host: Environment.instance.db_spec('accscms')[:host],
				username: Environment.instance.db_spec('accscms')[:username],
				passwowd: Environment.instance.db_spec('accscms')[:password],
				database: Environment.instance.db_spec('accscms')[:database]
			)
		end

		class User < CMSBaseDB
			self.table_name = 'user'
		end

	end
end

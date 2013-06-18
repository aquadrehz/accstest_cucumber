{
	:db => {
		:adapter => 'mysql2',
		:host => 'localhost',
		:username => 'accs',
		:password => 'accs'
	},
	:selenium => {
		:driver => :firefox,
		:base_url => 'http://localhost/accs'
	},
	:logger => {
		:level => 'ERROR'
	},
	:authorization => {
		:cms => {
			:username => '',
			:password => ''
		},
		:vaa => {
			:username => 'v01admin',
			:password => '123456'
		},
		:tmo => {
			:username => '',
			:password => ''
		},
		:oga => {
			:username => '',
			:password => ''
		}
	}
}
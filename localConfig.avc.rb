# Initialize Attribute was Created ----- Charoensak 201306191217
config = {
	:db => {
		:host => '192.168.56.101',
	},
	:selenium => {
    :driver => :firefox,
		:base_url => 'http://localhost:80/accs'
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
      :username => 'expadmin',
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
bash 'install mariadb' do
  code <<-EOH
  	apt-get install software-properties-common
		add-apt-repository 'deb http://mirror.jmu.edu/pub/mariadb/repo/10.1/ubuntu trusty main'
		apt-get -qq update
		yes y | apt-get install mariadb-server
	EOH
end
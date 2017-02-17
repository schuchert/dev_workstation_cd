execute 'install cf cli' do
  command "cd /tmp && wget -q -O cfcli.deb 'https://cli.run.pivotal.io/stable?release=debian64&version=6.24.0&source=github-rel' && dpkg -i /tmp/cfcli.deb && apt-get install -f" 
	action :run
end

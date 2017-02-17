execute 'install cf cli' do
  command 'locale-gen "en_US.UTF-8" && localectl set-locale LANG="en_US.UTF-8"'
	action :run
end


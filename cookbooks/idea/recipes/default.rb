idea_version = '2016.3.4'

cache = Chef::Config[:file_cache_path]
extract = "#{cache}/idea-#{idea_version}"
download_file = "#{cache}/ideaIC-#{idea_version}.tar.gz"
idea_dir = "/usr/local/bin/idea-#{idea_version}"

remote_file download_file do
	source "http://download.jetbrains.com/idea/ideaIC-#{idea_version}.tar.gz"
end

execute 'extract archive' do
  command "mkdir #{extract}; tar xf #{download_file} -C #{extract} --strip=1; mv #{extract} #{idea_dir}; chown -R vagrant:vagrant #{idea_dir}"
	action :run
end

# vmoptions config
template File.join("#{idea_dir}", "bin", "idea64.vmoptions") do
  source "idea64.vmoptions.erb"
  variables(
    :xms => "2048m",
    :xmx => "2048m"
  )
  owner 'vagrant'
  group 'vagrant'
  mode 0644
  action :create
end

# create desktop link
template "/home/vagrant/Desktop/Idea.desktop" do
  source "Idea.desktop.erb"
  variables(
    :idea_dir => "#{idea_dir}"
  )
  owner 'vagrant'
  group 'vagrant'
  mode 0744
  action :create
end

bash 'install mariadb' do
  code <<-EOH
    export DEBIAN_FRONTEND=noninteractive
    debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password password vagrant'
    debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password_again password vagrant'
    apt-get install software-properties-common
    add-apt-repository 'deb http://mirror.jmu.edu/pub/mariadb/repo/10.1/ubuntu trusty main'
    apt-get -qq update
    apt-get -y --force-yes install mariadb-server
  EOH
end
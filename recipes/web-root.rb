# install ganglia-webfrontend package
package "ganglia-webfrontend"

# create a .htpassword file for basic auth
htpasswd "/usr/share/ganglia-webfrontend/.htpasswd" do
  user "foo"
  password "bar"
end

# create the config from template
template "/etc/apache2/sites-available/ganglia" do
  source "ganglia-web.conf.erb"
end

# disable the default site
apache_site "default" do
  enable false
end

# enable the ganglia site
apache_site "ganglia" do
  enable true
end
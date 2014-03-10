include_recipe "php"
include_recipe "apache2"
include_recipe "apache2::mod_php5"

php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end

#package "libpcre3-dev" do
#  action :install
#end

#php_pear "apc" do
#  action :install
#  directives(:shm_size => "128M", :enable_cli => 0)
#end

package "php5-intl" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-json" do
  action :install
end

#include_recipe "composer"

web_app "php-training" do
  server_name "php-training"
  docroot "/vagrant_data"
end
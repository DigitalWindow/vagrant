include_recipe "php_site"

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

web_app "php-training" do
  server_name "php-training"
  docroot "/vagrant_data"
end
include_recipe "php"
include_recipe "apache2"
include_recipe "apache2::mod_php5"

package "php5-intl" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-json" do
  action :install
end

include_recipe "composer"

#web_app "php-training" do
#  server_name "php-training"
#  docroot "/vagrant_data"
#end
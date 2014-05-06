package 'httpd-devel'

cookbook_file '/usr/local/src/mod_antiloris.c' do
	source 'mod_antiloris.c'
end

execute "LoadModule" do
     command "echo \"#LoadModule foo_module /usr/lib/apache2/modules/foo.so\" >> #{node[:apache][:dir]}/conf/httpd.conf"
end

execute "Install mod_antiloris" do
	cwd "/usr/local/src"
	command "apxs -a -i -c mod_antiloris.c"
end

apache_module "antiloris" do
  enable true
end

execute "Restart Apache" do
    command "service httpd restart"
end
